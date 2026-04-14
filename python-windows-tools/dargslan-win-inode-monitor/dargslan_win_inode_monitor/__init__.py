"""
dargslan-win-inode-monitor — Windows Windows MFT & file system metadata monitor — NTFS metadata, file counts

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_inode_monitor.mftmonitor import MftMonitor

__all__ = ["MftMonitor"]
