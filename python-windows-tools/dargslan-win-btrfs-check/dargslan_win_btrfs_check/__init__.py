"""
dargslan-win-btrfs-check — Windows Storage Spaces & ReFS health checker — pools, disks, volumes, resilience

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_btrfs_check.storagespacescheck import StorageSpacesCheck

__all__ = ["StorageSpacesCheck"]
