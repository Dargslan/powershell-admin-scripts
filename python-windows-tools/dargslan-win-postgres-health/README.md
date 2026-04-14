# dargslan-win-postgres-health

**Windows Windows PostgreSQL health checker — connections, queries, replication**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-postgres-health
```

## Usage

### Command Line
```bash
dargslan-win-postgres-health
dargslan-win-postgres-health --json
```

### Python API
```python
from dargslan_win_postgres_health import PostgresHealth

tool = PostgresHealth()
report = tool.check()
print(report)
```

## Features

- `check_connection()` — Check connection
- `check_queries()` — Check queries
- `check_replication()` — Check replication
- `check_locks()` — Check locks

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
