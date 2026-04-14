"""
dargslan-win-journal-export — Windows Windows Event Log export tool — export/backup event logs to file

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_journal_export.eventlogexport import EventLogExport

__all__ = ["EventLogExport"]
