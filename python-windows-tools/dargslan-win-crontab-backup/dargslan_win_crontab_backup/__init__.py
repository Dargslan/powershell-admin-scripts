"""
dargslan-win-crontab-backup — Windows Windows Task Scheduler backup & export — task XML export/import

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_crontab_backup.taskschedulerbackup import TaskSchedulerBackup

__all__ = ["TaskSchedulerBackup"]
