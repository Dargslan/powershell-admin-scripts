"""
dargslan-win-selinux-check — Windows Windows Mandatory Integrity Control (MIC) checker — integrity levels, UAC

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_selinux_check.integritycontrol import IntegrityControl

__all__ = ["IntegrityControl"]
