"""
dargslan-win-lsof-audit — Windows Windows open file & handle auditor — process handles, file locks

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_lsof_audit.handleaudit import HandleAudit

__all__ = ["HandleAudit"]
