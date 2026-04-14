"""
dargslan-win-numa-check — Windows Windows NUMA topology checker — node configuration, memory distribution

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_numa_check.numacheck import NumaCheck

__all__ = ["NumaCheck"]
