# dargslan-win-systemd-analyze

**Windows Windows boot performance analyzer — boot time, startup impact, delays**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-systemd-analyze
```

## Usage

### Command Line
```bash
dargslan-win-systemd-analyze
dargslan-win-systemd-analyze --json
```

### Python API
```python
from dargslan_win_systemd_analyze import BootAnalyzer

tool = BootAnalyzer()
report = tool.check()
print(report)
```

## Features

- `get_boot_time()` — Get boot time
- `check_startup_impact()` — Check startup impact
- `list_startup_programs()` — List startup programs
- `check_services()` — Check services

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
