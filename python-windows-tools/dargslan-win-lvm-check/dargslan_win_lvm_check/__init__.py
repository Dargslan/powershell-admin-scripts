"""
dargslan-win-lvm-check — Windows Windows disk partition & volume manager — dynamic disks, partitions

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_lvm_check.volumemanager import VolumeManager

__all__ = ["VolumeManager"]
