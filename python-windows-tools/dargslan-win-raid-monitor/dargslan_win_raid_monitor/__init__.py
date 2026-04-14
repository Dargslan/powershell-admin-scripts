"""
dargslan-win-raid-monitor — Windows Windows Storage Spaces & disk redundancy monitor — RAID health, rebuild status

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_raid_monitor.raidmonitor import RaidMonitor

__all__ = ["RaidMonitor"]
