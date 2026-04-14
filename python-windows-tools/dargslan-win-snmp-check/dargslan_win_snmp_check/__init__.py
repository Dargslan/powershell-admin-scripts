"""
dargslan-win-snmp-check — Windows Windows SNMP service checker — SNMP configuration, community strings, traps

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_snmp_check.snmpcheck import SnmpCheck

__all__ = ["SnmpCheck"]
