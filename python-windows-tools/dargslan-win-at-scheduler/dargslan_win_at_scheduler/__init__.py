"""
dargslan-win-at-scheduler — Windows Task Scheduler manager — scheduled tasks, triggers, actions, history

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_at_scheduler.taskschedulermanager import TaskSchedulerManager

__all__ = ["TaskSchedulerManager"]
