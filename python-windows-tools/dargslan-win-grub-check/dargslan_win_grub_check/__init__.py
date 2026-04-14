"""
dargslan-win-grub-check — Windows Windows Boot Configuration (BCD) checker — boot entries, recovery, secure boot

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_grub_check.bootconfigcheck import BootConfigCheck

__all__ = ["BootConfigCheck"]
