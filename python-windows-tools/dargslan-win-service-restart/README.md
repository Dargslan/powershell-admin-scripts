# dargslan-win-service-restart

**Windows Windows service restart manager — restart, stop, start, dependency-aware**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-service-restart
```

## Usage

### Command Line
```bash
dargslan-win-service-restart
dargslan-win-service-restart --json
```

### Python API
```python
from dargslan_win_service_restart import ServiceRestart

tool = ServiceRestart()
report = tool.check()
print(report)
```

## Features

- `restart_service()` — Restart service
- `stop_service()` — Stop service
- `start_service()` — Start service
- `restart_with_deps()` — Restart with deps

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
