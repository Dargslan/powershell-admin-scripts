"""
dargslan-win-env-audit — Windows Windows environment variables auditor — system/user vars, PATH analysis

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_env_audit.envaudit import EnvAudit

__all__ = ["EnvAudit"]
