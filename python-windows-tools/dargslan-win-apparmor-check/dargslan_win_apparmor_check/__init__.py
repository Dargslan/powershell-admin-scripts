"""
dargslan-win-apparmor-check — Windows Defender Application Control (WDAC) policy auditor

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_apparmor_check.wdaccheck import WdacCheck

__all__ = ["WdacCheck"]
