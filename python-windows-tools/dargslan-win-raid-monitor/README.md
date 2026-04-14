# dargslan-win-raid-monitor

**Windows Windows Storage Spaces & disk redundancy monitor — RAID health, rebuild status**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-raid-monitor
```

## Usage

### Command Line
```bash
dargslan-win-raid-monitor
dargslan-win-raid-monitor --json
```

### Python API
```python
from dargslan_win_raid_monitor import RaidMonitor

tool = RaidMonitor()
report = tool.check()
print(report)
```

## Features

- `check_storage_spaces()` — Check storage spaces
- `check_disk_status()` — Check disk status
- `check_rebuild()` — Check rebuild

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
