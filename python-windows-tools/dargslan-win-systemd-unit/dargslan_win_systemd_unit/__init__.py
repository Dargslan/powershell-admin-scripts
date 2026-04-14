"""
dargslan-win-systemd-unit — Windows Windows service unit manager — service config, recovery, dependencies

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_systemd_unit.serviceunit import ServiceUnit

__all__ = ["ServiceUnit"]
