# dargslan-win-log-parser

**Windows Windows Event Log parser — custom log queries, filtering, export**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-log-parser
```

## Usage

### Command Line
```bash
dargslan-win-log-parser
dargslan-win-log-parser --json
```

### Python API
```python
from dargslan_win_log_parser import EventLogParser

tool = EventLogParser()
report = tool.check()
print(report)
```

## Features

- `parse_log()` — Parse log
- `search_events()` — Search events
- `filter_by_level()` — Filter by level
- `export_csv()` — Export csv

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
