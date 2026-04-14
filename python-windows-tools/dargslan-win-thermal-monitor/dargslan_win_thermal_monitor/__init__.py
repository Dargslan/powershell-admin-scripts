"""
dargslan-win-thermal-monitor — Windows Windows thermal & temperature monitor — CPU temp, fan speed, thermal events

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_thermal_monitor.thermalmonitor import ThermalMonitor

__all__ = ["ThermalMonitor"]
