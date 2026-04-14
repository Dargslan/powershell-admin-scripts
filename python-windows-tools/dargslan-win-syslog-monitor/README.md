# dargslan-win-syslog-monitor

**Windows Windows Event Log real-time monitor — live event watching, filtering**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-syslog-monitor
```

## Usage

### Command Line
```bash
dargslan-win-syslog-monitor
dargslan-win-syslog-monitor --json
```

### Python API
```python
from dargslan_win_syslog_monitor import EventLogMonitor

tool = EventLogMonitor()
report = tool.check()
print(report)
```

## Features

- `watch_events()` — Watch events
- `filter_errors()` — Filter errors
- `monitor_security()` — Monitor security
- `get_recent()` — Get recent

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
