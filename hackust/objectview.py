# !/usr/bin/python3
# coding: utf-8

# citations: https://github.com/mre/receipt-parser


class ObjectView(object):
    """ View objects as dicts """

    def __init__(self, d):
        """
        :param d: {}
            Object data
        """

        self.__dict__ = d