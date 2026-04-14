# dargslan-win-uptime-report

**Windows Windows uptime report — system uptime, last boot, restart history**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-uptime-report
```

## Usage

### Command Line
```bash
dargslan-win-uptime-report
dargslan-win-uptime-report --json
```

### Python API
```python
from dargslan_win_uptime_report import UptimeReport

tool = UptimeReport()
report = tool.check()
print(report)
```

## Features

- `get_uptime()` — Get uptime
- `get_last_boot()` — Get last boot
- `get_restart_history()` — Get restart history
- `check_planned()` — Check planned

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
