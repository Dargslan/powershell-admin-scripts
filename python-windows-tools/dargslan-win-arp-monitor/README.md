# dargslan-win-arp-monitor

**Windows ARP table monitor — ARP cache, MAC address tracking, duplicate detection**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-arp-monitor
```

## Usage

### Command Line
```bash
dargslan-win-arp-monitor
dargslan-win-arp-monitor --json
```

### Python API
```python
from dargslan_win_arp_monitor import ArpMonitor

tool = ArpMonitor()
report = tool.full_audit()
print(report)
```

## Features

- `get_arp_table()` — Get arp table
- `detect_duplicates()` — Detect duplicates
- `monitor_changes()` — Monitor changes
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
