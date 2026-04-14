"""
dargslan-win-route-check — Windows Windows routing table checker — routes, gateways, persistent routes

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_route_check.routecheck import RouteCheck

__all__ = ["RouteCheck"]
