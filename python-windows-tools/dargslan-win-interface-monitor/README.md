# dargslan-win-interface-monitor

**Windows Windows network interface monitor — adapter status, speed, errors**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-interface-monitor
```

## Usage

### Command Line
```bash
dargslan-win-interface-monitor
dargslan-win-interface-monitor --json
```

### Python API
```python
from dargslan_win_interface_monitor import InterfaceMonitor

tool = InterfaceMonitor()
report = tool.check()
print(report)
```

## Features

- `list_adapters()` — List adapters
- `check_errors()` — Check errors
- `check_speed()` — Check speed
- `monitor_status()` — Monitor status

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
