"""
dargslan-win-ipv6-audit — Windows Windows IPv6 configuration auditor — IPv6 status, tunnel adapters, privacy

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ipv6_audit.ipv6audit import Ipv6Audit

__all__ = ["Ipv6Audit"]
