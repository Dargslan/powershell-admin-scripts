"""
dargslan-win-cgroup-monitor — Windows process resource monitor — per-process CPU, memory, I/O tracking

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cgroup_monitor.processresourcemonitor import ProcessResourceMonitor

__all__ = ["ProcessResourceMonitor"]
