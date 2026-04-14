"""
dargslan-win-service-restart — Windows Windows service restart manager — restart, stop, start, dependency-aware

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_service_restart.servicerestart import ServiceRestart

__all__ = ["ServiceRestart"]
