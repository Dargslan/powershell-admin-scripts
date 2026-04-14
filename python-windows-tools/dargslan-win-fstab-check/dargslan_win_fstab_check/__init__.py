"""
dargslan-win-fstab-check — Windows Windows mount points & drive mapping checker — mapped drives, disk config

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_fstab_check.mountpointcheck import MountPointCheck

__all__ = ["MountPointCheck"]
