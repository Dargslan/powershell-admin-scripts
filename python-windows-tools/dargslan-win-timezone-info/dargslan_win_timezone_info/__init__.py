"""
dargslan-win-timezone-info — Windows Windows timezone information tool — current timezone, UTC offset, DST rules

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_timezone_info.timezoneinfo import TimezoneInfo

__all__ = ["TimezoneInfo"]
