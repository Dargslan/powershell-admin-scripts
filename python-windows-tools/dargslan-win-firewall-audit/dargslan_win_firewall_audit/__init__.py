"""
dargslan-win-firewall-audit — Windows Windows Firewall auditor — rules, profiles, logging, inbound/outbound

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_firewall_audit.firewallaudit import FirewallAudit

__all__ = ["FirewallAudit"]
