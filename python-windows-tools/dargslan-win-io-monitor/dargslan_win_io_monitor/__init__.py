"""
dargslan-win-io-monitor — Windows Windows disk I/O monitor — read/write rates, queue depth, latency

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_io_monitor.iomonitor import IoMonitor

__all__ = ["IoMonitor"]
