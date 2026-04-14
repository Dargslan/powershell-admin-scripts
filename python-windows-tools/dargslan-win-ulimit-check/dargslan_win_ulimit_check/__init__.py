"""
dargslan-win-ulimit-check — Windows Windows process resource limit checker — handle count, memory limits, job quotas

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ulimit_check.resourcelimitcheck import ResourceLimitCheck

__all__ = ["ResourceLimitCheck"]
