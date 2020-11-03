# This follows yyyy-mm-dd format

import datetime
import time
from datetime import date, datetime

from talon import Module

mod = Module()


@mod.action_class
class Actions:
    def date_now() -> str:
        """returns the date YYYY-MM-DD and time """
        return datetime.today()

    def date_today() -> str:
        """return todays date (year, month, day) as a string"""
        return date.today()

    def date_tomorrow() -> str:
        """return tomorrow date (year, month, day) as a string"""
        # print(date.today())
        pass

    def date_yesterday() -> str:
        """return yesterday date (year, month, day) as a string"""
        # print(date.today())
        pass
