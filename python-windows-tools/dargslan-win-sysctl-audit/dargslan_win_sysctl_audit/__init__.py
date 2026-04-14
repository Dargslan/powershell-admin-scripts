"""
dargslan-win-sysctl-audit — Windows Windows registry security settings auditor — system hardening parameters

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_sysctl_audit.registryaudit import RegistryAudit

__all__ = ["RegistryAudit"]
