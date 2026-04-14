"""
dargslan-win-socket-stats — Windows Windows network socket statistics — TCP/UDP stats, connection states

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_socket_stats.socketstats import SocketStats

__all__ = ["SocketStats"]
