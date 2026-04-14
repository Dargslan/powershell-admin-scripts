"""
dargslan-win-nfs-health — Windows Windows SMB/CIFS share health checker — share status, sessions, open files

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_nfs_health.smbhealth import SmbHealth

__all__ = ["SmbHealth"]
