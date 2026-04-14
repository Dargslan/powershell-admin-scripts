"""
dargslan-win-mount-monitor — Windows Windows drive mount monitor — mounted volumes, removable drives, network shares

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_mount_monitor.drivemonitor import DriveMonitor

__all__ = ["DriveMonitor"]
