"""
dargslan-win-iptables-export — Windows Windows Firewall rule export tool — backup/restore firewall configuration

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_iptables_export.firewallexport import FirewallExport

__all__ = ["FirewallExport"]
