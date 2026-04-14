# dargslan-win-redis-health

**Windows Windows Redis server health checker — memory, connections, persistence**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-redis-health
```

## Usage

### Command Line
```bash
dargslan-win-redis-health
dargslan-win-redis-health --json
```

### Python API
```python
from dargslan_win_redis_health import RedisHealth

tool = RedisHealth()
report = tool.check()
print(report)
```

## Features

- `check_connection()` — Check connection
- `check_memory()` — Check memory
- `check_persistence()` — Check persistence
- `check_replication()` — Check replication

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
