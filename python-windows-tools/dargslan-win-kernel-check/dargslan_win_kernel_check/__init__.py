"""
dargslan-win-kernel-check — Windows Windows OS & kernel version checker — build info, feature updates

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_kernel_check.windowsversioncheck import WindowsVersionCheck

__all__ = ["WindowsVersionCheck"]
