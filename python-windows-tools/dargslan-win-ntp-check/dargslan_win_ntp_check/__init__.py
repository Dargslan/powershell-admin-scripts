"""
dargslan-win-ntp-check — Windows Windows time synchronization checker — W32Time, NTP server, time skew

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ntp_check.timesync import TimeSync

__all__ = ["TimeSync"]
