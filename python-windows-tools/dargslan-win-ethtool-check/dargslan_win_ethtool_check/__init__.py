"""
dargslan-win-ethtool-check — Windows Windows network adapter advanced settings — speed, duplex, offload

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ethtool_check.netadaptercheck import NetAdapterCheck

__all__ = ["NetAdapterCheck"]
