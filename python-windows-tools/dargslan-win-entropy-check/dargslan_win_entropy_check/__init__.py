"""
dargslan-win-entropy-check — Windows Windows random number generator & crypto entropy checker

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_entropy_check.entropycheck import EntropyCheck

__all__ = ["EntropyCheck"]
