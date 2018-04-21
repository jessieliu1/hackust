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
        self.store = self.date = self.time = self.sum = None
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
        lines = ['11/24/1997'] #changed for testing
        for line in lines: #changed for testing
            for date_format in date_formats:
                try:
                    date = datetime.strptime(line, date_format)
                except ValueError:
                    pass
                else:
                    break
        else:
            date = None
        print(date)
        return date

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
            print(receipt_path, receipt.date)

def main():
    config = read_config()
    receipts = get_files(config.receipts_path)
    ocr_receipts(config, receipts)


if __name__ == "__main__":
    main()



