# dargslan-win-mount-monitor

**Windows Windows drive mount monitor — mounted volumes, removable drives, network shares**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-mount-monitor
```

## Usage

### Command Line
```bash
dargslan-win-mount-monitor
dargslan-win-mount-monitor --json
```

### Python API
```python
from dargslan_win_mount_monitor import DriveMonitor

tool = DriveMonitor()
report = tool.check()
print(report)
```

## Features

- `list_mounted()` — List mounted
- `check_removable()` — Check removable
- `list_network_drives()` — List network drives
- `check_usb()` — Check usb

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
