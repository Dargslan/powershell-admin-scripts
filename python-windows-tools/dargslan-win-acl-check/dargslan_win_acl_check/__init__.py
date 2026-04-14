"""
dargslan-win-acl-check — Windows NTFS ACL & permissions auditor — file/folder security, inheritance, owner checks

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_acl_check.aclcheck import AclCheck

__all__ = ["AclCheck"]
