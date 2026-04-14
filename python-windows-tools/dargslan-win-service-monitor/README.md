# dargslan-win-service-monitor

**Windows Windows service monitor — service status, startup type, dependencies**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-service-monitor
```

## Usage

### Command Line
```bash
dargslan-win-service-monitor
dargslan-win-service-monitor --json
```

### Python API
```python
from dargslan_win_service_monitor import ServiceMonitor

tool = ServiceMonitor()
report = tool.check()
print(report)
```

## Features

- `list_services()` — List services
- `check_failed()` — Check failed
- `check_auto_start()` — Check auto start
- `get_dependencies()` — Get dependencies

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
