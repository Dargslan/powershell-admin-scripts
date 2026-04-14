"""
dargslan-win-lastlog-audit — Windows Windows last logon auditor — user login history, stale accounts

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_lastlog_audit.lastlogonaudit import LastLogonAudit

__all__ = ["LastLogonAudit"]
