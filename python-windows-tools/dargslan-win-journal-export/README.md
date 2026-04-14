# dargslan-win-journal-export

**Windows Windows Event Log export tool — export/backup event logs to file**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-journal-export
```

## Usage

### Command Line
```bash
dargslan-win-journal-export
dargslan-win-journal-export --json
```

### Python API
```python
from dargslan_win_journal_export import EventLogExport

tool = EventLogExport()
report = tool.check()
print(report)
```

## Features

- `export_log()` — Export log
- `export_filtered()` — Export filtered
- `list_logs()` — List logs

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
