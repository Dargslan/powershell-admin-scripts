# dargslan-win-log-stats

**Windows Windows Event Log statistics — event counts, error rates, log sizes**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-log-stats
```

## Usage

### Command Line
```bash
dargslan-win-log-stats
dargslan-win-log-stats --json
```

### Python API
```python
from dargslan_win_log_stats import LogStats

tool = LogStats()
report = tool.check()
print(report)
```

## Features

- `get_log_sizes()` — Get log sizes
- `count_by_level()` — Count by level
- `get_error_rate()` — Get error rate
- `top_sources()` — Top sources

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
