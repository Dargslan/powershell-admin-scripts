"""
dargslan-win-kernel-module — Windows Windows driver & kernel module manager — loaded drivers, driver signing

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_kernel_module.drivermanager import DriverManager

__all__ = ["DriverManager"]
