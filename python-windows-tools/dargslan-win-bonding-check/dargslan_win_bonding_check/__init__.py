"""
dargslan-win-bonding-check — Windows NIC Teaming checker — team status, load balancing, failover configuration

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_bonding_check.nicteamingcheck import NicTeamingCheck

__all__ = ["NicTeamingCheck"]
