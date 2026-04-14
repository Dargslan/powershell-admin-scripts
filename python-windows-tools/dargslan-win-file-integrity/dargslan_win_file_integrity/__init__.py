"""
dargslan-win-file-integrity — Windows Windows file integrity monitor — hash verification, change detection

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_file_integrity.fileintegrity import FileIntegrity

__all__ = ["FileIntegrity"]
