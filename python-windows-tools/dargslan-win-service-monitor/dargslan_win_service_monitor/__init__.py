"""
dargslan-win-service-monitor — Windows Windows service monitor — service status, startup type, dependencies

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_service_monitor.servicemonitor import ServiceMonitor

__all__ = ["ServiceMonitor"]
