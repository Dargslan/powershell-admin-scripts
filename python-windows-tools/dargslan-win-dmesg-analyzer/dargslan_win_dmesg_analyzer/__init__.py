"""
dargslan-win-dmesg-analyzer — Windows Windows System Event Log analyzer — hardware events, driver errors

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_dmesg_analyzer.systemeventanalyzer import SystemEventAnalyzer

__all__ = ["SystemEventAnalyzer"]
