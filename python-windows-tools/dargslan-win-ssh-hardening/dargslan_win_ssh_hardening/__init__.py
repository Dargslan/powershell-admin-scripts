"""
dargslan-win-ssh-hardening — Windows Windows OpenSSH hardening checker — security best practices, key types

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_ssh_hardening.sshhardening import SshHardening

__all__ = ["SshHardening"]
