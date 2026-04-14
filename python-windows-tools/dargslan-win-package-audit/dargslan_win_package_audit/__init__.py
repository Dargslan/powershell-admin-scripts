"""
dargslan-win-package-audit — Windows Windows installed software auditor — vulnerable packages, outdated software

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_package_audit.softwareaudit import SoftwareAudit

__all__ = ["SoftwareAudit"]
