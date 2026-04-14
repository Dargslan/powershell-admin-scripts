# dargslan-win-process-monitor

**Windows Windows process monitor — real-time process tracking, alerts, history**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-process-monitor
```

## Usage

### Command Line
```bash
dargslan-win-process-monitor
dargslan-win-process-monitor --json
```

### Python API
```python
from dargslan_win_process_monitor import ProcessMonitor

tool = ProcessMonitor()
report = tool.check()
print(report)
```

## Features

- `list_processes()` — List processes
- `track_new()` — Track new
- `check_suspicious()` — Check suspicious
- `get_tree()` — Get tree

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
