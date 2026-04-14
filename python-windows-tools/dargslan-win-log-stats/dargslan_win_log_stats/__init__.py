"""
dargslan-win-log-stats — Windows Windows Event Log statistics — event counts, error rates, log sizes

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_log_stats.logstats import LogStats

__all__ = ["LogStats"]
