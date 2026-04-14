"""
dargslan-win-sysinfo — Windows Windows system information tool — hardware, OS, CPU, memory, disk, network

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_sysinfo.systeminfo import SystemInfo

__all__ = ["SystemInfo"]
