"""
dargslan-win-cron-parser — Windows Task Scheduler trigger parser — cron-to-Windows, trigger decoding

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cron_parser.tasktriggerparser import TaskTriggerParser

__all__ = ["TaskTriggerParser"]
