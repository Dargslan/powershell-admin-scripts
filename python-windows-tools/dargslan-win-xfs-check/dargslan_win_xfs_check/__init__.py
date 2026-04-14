"""
dargslan-win-xfs-check — Windows Windows ReFS filesystem checker — ReFS integrity, metadata, optimization

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_xfs_check.refscheck import ReFsCheck

__all__ = ["ReFsCheck"]
