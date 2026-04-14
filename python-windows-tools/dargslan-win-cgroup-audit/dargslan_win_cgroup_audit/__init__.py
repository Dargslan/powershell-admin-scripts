"""
dargslan-win-cgroup-audit — Windows Job Objects & process resource limits auditor — CPU affinity, memory limits

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_cgroup_audit.resourcelimitsaudit import ResourceLimitsAudit

__all__ = ["ResourceLimitsAudit"]
