"""
dargslan-win-cert-manager — Windows Certificate Store manager — certificate inventory, expiry, trust chain audit

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cert_manager.certmanager import CertManager

__all__ = ["CertManager"]
