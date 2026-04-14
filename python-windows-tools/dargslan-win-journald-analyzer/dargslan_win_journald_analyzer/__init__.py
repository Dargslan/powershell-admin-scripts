"""
dargslan-win-journald-analyzer — Windows Windows Event Log analyzer — application, system, security log analysis

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_journald_analyzer.eventloganalyzer import EventLogAnalyzer

__all__ = ["EventLogAnalyzer"]
