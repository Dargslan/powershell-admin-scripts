"""
dargslan-win-disk-quota — Windows Windows disk quota manager — NTFS quotas, user usage, limit configuration

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_disk_quota.diskquota import DiskQuota

__all__ = ["DiskQuota"]
