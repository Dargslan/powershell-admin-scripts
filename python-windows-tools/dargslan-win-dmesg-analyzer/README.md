# dargslan-win-dmesg-analyzer

**Windows Windows System Event Log analyzer — hardware events, driver errors**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-dmesg-analyzer
```

## Usage

### Command Line
```bash
dargslan-win-dmesg-analyzer
dargslan-win-dmesg-analyzer --json
```

### Python API
```python
from dargslan_win_dmesg_analyzer import SystemEventAnalyzer

tool = SystemEventAnalyzer()
report = tool.check()
print(report)
```

## Features

- `get_hardware_errors()` — Get hardware errors
- `get_driver_events()` — Get driver events
- `get_warnings()` — Get warnings

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
