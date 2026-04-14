"""
dargslan-win-user-sessions — Windows Windows user session monitor — active sessions, RDP, logged-in users

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_user_sessions.usersessions import UserSessions

__all__ = ["UserSessions"]
