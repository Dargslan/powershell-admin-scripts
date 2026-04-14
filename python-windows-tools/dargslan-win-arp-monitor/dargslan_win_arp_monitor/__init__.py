"""
dargslan-win-arp-monitor — Windows ARP table monitor — ARP cache, MAC address tracking, duplicate detection

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_arp_monitor.arpmonitor import ArpMonitor

__all__ = ["ArpMonitor"]
