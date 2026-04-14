"""
dargslan-win-user-audit — Windows Windows user account auditor — local users, admin check, password policy

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_user_audit.useraudit import UserAudit

__all__ = ["UserAudit"]
