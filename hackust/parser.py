# !/usr/bin/python3
# citations: https://github.com/mre/receipt-parser
# fuzzy matching for receipt parsing

#things that we could potentially want: date, place, total/subtotals, categories
import os
import re
import time
from collections import defaultdict
from difflib import get_close_matches

import yaml

from objectview import ObjectView

from datetime import datetime

class Receipt(object):

    def __init__(self, config, raw_text):
        """
        config: ObjectView config object
        raw: array of ocr parsed str lines in the file
        """

        self.config = config
        self.store = self.date = self.time = self.total = None
        self.lines = raw_text
        self.sanitize()
        self.parse()


    def sanitize(self):
        """
        strip text and convert to lowercase
        """
        self.lines = [line.lower() for line in self.lines if line.strip()]

    def parse(self):
        """
        parse for the key terms

        """
        self.date = self.parse_date()
        self.time = self.parse_time()
        self.store = self.parse_store()
        self.total = self.parse_total()

    def fuzzy_find(self, keyword, accuracy=0.6):
        """
        use python difflib to fuzzy search for matches
        returns the first line in lines that contains a keyword
        """
        for line in self.lines:
            words = line.split()
            first_match = get_close_matches(keyword, words, 1, accuracy)
            if first_match:
                return line

    def parse_date(self):
        """
        parses a variety of dates
        """
        date_formats = ['%m/%d/%Y', '%Y/%m/%d', '%d/%m/%Y', '%m/%d/%Y', '%Y/%m/%d', '%m/%d/%Y', '%Y.%m.%d', '%d.%m.%Y', '%m.%d.%Y', '%Y.%m.%d']
        #lines = ['11/24/1997'] #changed for testing
        date = None
        for line in self.lines: 
            phrases = line.split()
            for phrase in phrases:
                for date_format in date_formats:
                    try:
                        phrase = phrase.strip()
                        date = datetime.strptime(phrase, date_format)
                        if date:
                            break
                    except ValueError:
                        pass
                    else:
                        break
        return date.date()

    def parse_time(self):
        time_formats = ['%H:%M:%S', '%H:%M', '%I:%M %p']
        time = None
        for line in self.lines: 
            phrases = line.split()
            for i in range(0, len(phrases)):
                for time_format in time_formats:
                    try:
                        phrase = phrases[i].strip()
                        if i < (len(phrases) - 1):
                            phrase = phrases[i] + " " + phrases[i+1].strip()
                            time = datetime.strptime(phrase, time_format)
                            if time:
                                break
                        time = datetime.strptime(phrase, time_format)
                        if time:
                            break
                    except ValueError:
                        pass
                    else:
                        break
        return time.time()

    def parse_store(self):
        for int_accuracy in range(10, 6, -1):
            accuracy = int_accuracy / 10.0

            for store, spellings in self.config.stores.items():
                for spelling in spellings:
                    line = self.fuzzy_find(spelling, accuracy)
                    if line:
                        return store

    def parse_total(self):
        for i in range(0, len(self.lines)):
            for word in self.lines[i].split():
                word = word.strip()
                if word in self.config.sum_keys: 
                    line = self.lines[i].replace(",", ".")
                    sum_float = re.search(self.config.sum_format, line)
                    if sum_float:
                        return sum_float.group(0)
                    elif (i < len(self.lines) - 1):
                        sum_float = re.search(self.config.sum_format, self.lines[i+1])
                        if sum_float:
                            return sum_float.group(0)
        return None


def read_config(file="config.yml"):
        stream = open(os.path.join(os.getcwd(), file), "r")
        docs = yaml.safe_load(stream)
        return ObjectView(docs)

def get_files(folder):
    files = os.listdir(folder)
    files = [f for f in files if not f.startswith(".")] #no hidden files!
    files = [
        os.path.join(folder, f) for f in files
    ]
    return [f for f in files if os.path.isfile(f)]

def ocr_receipts(config, receipt_files):
    for receipt_path in receipt_files:
        with open(receipt_path) as receipt:
            receipt = Receipt(config, receipt.readlines())
            print(receipt_path, receipt.date, receipt.time, receipt.store, receipt.total)

def main():
    config = read_config()
    receipts = get_files(config.receipts_path)
    ocr_receipts(config, receipts)


if __name__ == "__main__":
    main()



