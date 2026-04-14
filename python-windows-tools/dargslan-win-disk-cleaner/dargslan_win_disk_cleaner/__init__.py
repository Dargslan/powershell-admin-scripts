"""
dargslan-win-disk-cleaner — Windows Windows disk cleanup tool — temp files, recycle bin, Windows Update cache

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_disk_cleaner.diskcleaner import DiskCleaner

__all__ = ["DiskCleaner"]
