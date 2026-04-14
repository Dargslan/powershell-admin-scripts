"""
dargslan-win-syslog-monitor — Windows Windows Event Log real-time monitor — live event watching, filtering

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_syslog_monitor.eventlogmonitor import EventLogMonitor

__all__ = ["EventLogMonitor"]
