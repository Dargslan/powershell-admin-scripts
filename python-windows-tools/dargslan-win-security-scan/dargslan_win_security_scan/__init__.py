"""
dargslan-win-security-scan — Windows Windows security scanner — Defender status, firewall, updates, configuration

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_security_scan.securityscan import SecurityScan

__all__ = ["SecurityScan"]
