"""
dargslan-win-resolv-check — Windows Windows DNS client configuration checker — DNS servers, suffix search list

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_resolv_check.dnsclientcheck import DnsClientCheck

__all__ = ["DnsClientCheck"]
