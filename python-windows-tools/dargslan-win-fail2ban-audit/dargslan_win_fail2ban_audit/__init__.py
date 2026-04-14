"""
dargslan-win-fail2ban-audit — Windows Windows account lockout & brute-force protection auditor

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_fail2ban_audit.accountlockoutaudit import AccountLockoutAudit

__all__ = ["AccountLockoutAudit"]
