"""
dargslan-win-net-scanner — Windows Windows network scanner — ping sweep, port scan, service detection

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_net_scanner.netscanner import NetScanner

__all__ = ["NetScanner"]
