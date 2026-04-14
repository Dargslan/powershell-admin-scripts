"""
dargslan-win-cpu-freq — Windows CPU performance monitor — clock speed, power plan, thermal throttling

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cpu_freq.cpuperformance import CpuPerformance

__all__ = ["CpuPerformance"]
