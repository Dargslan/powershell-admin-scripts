"""
dargslan-win-disk-benchmark — Windows Windows disk performance benchmark — read/write speed, IOPS testing

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_disk_benchmark.diskbenchmark import DiskBenchmark

__all__ = ["DiskBenchmark"]
