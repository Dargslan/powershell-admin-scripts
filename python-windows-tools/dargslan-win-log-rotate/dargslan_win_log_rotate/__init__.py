"""
dargslan-win-log-rotate — Windows Windows log rotation manager — IIS logs, event logs, application logs

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_log_rotate.logrotation import LogRotation

__all__ = ["LogRotation"]
