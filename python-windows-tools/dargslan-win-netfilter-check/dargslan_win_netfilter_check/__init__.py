"""
dargslan-win-netfilter-check — Windows Windows Filtering Platform (WFP) auditor — network filters, callouts

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_netfilter_check.wfpaudit import WfpAudit

__all__ = ["WfpAudit"]
