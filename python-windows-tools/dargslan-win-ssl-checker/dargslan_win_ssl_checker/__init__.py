"""
dargslan-win-ssl-checker — Windows Windows SSL/TLS certificate checker — expiry, chain, protocols, cipher suites

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ssl_checker.sslchecker import SslChecker

__all__ = ["SslChecker"]
