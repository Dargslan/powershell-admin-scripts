"""
dargslan-win-postgres-health — Windows Windows PostgreSQL health checker — connections, queries, replication

Windows system administration tool by Dargslan.

Homepage: https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
Windows & DevOps Books: https://dargslan.com/books
"""

__version__ = "1.0.0"
__author__ = "Dargslan"
__url__ = "https://dargslan.com"

from dargslan_win_postgres_health.postgreshealth import PostgresHealth

__all__ = ["PostgresHealth"]
