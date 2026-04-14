"""
dargslan-win-log-parser — Windows Windows Event Log parser — custom log queries, filtering, export

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_log_parser.eventlogparser import EventLogParser

__all__ = ["EventLogParser"]
