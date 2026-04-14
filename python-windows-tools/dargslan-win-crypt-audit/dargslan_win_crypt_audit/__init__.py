"""
dargslan-win-crypt-audit — Windows Windows BitLocker & encryption auditor — drive encryption status, TPM, recovery keys

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_crypt_audit.bitlockeraudit import BitLockerAudit

__all__ = ["BitLockerAudit"]
