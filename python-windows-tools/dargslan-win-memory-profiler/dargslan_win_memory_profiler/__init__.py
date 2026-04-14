"""
dargslan-win-memory-profiler — Windows Windows memory profiler — per-process memory, page file, working set

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_memory_profiler.memoryprofiler import MemoryProfiler

__all__ = ["MemoryProfiler"]
