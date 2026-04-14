"""
dargslan-win-apt-check — Windows Update checker — pending updates, update history, WSUS status

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_apt_check.windowsupdatecheck import WindowsUpdateCheck

__all__ = ["WindowsUpdateCheck"]
