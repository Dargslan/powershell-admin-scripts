# dargslan-win-mysql-health

**Windows Windows MySQL/MariaDB health checker — connections, performance, replication**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-mysql-health
```

## Usage

### Command Line
```bash
dargslan-win-mysql-health
dargslan-win-mysql-health --json
```

### Python API
```python
from dargslan_win_mysql_health import MysqlHealth

tool = MysqlHealth()
report = tool.check()
print(report)
```

## Features

- `check_connection()` — Check connection
- `check_performance()` — Check performance
- `check_replication()` — Check replication

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
