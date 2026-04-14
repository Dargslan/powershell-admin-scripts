"""
dargslan-win-toolkit — Windows Complete Windows sysadmin toolkit — meta-package installing all Dargslan Windows tools

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_toolkit.toolkit import Toolkit

__all__ = ["Toolkit"]
