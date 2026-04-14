"""
dargslan-win-tcp-monitor — Windows Windows TCP connection monitor — active connections, states, remote endpoints

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_tcp_monitor.tcpmonitor import TcpMonitor

__all__ = ["TcpMonitor"]
