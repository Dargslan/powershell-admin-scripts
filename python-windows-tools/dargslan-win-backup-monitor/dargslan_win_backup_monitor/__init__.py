"""
dargslan-win-backup-monitor — Windows Backup monitor — Windows Server Backup, VSS snapshots, backup status

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_backup_monitor.backupmonitor import BackupMonitor

__all__ = ["BackupMonitor"]
