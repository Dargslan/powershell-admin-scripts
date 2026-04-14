"""
dargslan-win-dns-check — Windows Windows DNS configuration checker — DNS servers, cache, resolution, NRPT

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_dns_check.dnscheck import DnsCheck

__all__ = ["DnsCheck"]
