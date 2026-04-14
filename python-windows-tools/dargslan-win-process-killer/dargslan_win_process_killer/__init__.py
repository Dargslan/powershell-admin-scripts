"""
dargslan-win-process-killer — Windows Windows process manager — kill by name/PID, find resource hogs, zombie cleanup

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_process_killer.processkiller import ProcessKiller

__all__ = ["ProcessKiller"]
