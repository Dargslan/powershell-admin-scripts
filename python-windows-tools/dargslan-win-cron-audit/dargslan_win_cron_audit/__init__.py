"""
dargslan-win-cron-audit — Windows Task Scheduler audit — security review, privileged tasks, trigger analysis

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cron_audit.taskscheduleraudit import TaskSchedulerAudit

__all__ = ["TaskSchedulerAudit"]
