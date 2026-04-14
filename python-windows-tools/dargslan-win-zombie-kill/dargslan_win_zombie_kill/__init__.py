"""
dargslan-win-zombie-kill — Windows Windows hung process killer — not responding, ghost processes, cleanup

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_zombie_kill.zombiekill import ZombieKill

__all__ = ["ZombieKill"]
