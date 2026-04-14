"""
dargslan-win-bash-alias — Windows PowerShell profile & alias manager — PS profiles, aliases, functions, environment

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_bash_alias.profilemanager import ProfileManager

__all__ = ["ProfileManager"]
