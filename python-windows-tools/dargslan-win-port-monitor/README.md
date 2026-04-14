# dargslan-win-port-monitor

**Windows Windows listening port monitor — TCP/UDP ports, associated processes**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-port-monitor
```

## Usage

### Command Line
```bash
dargslan-win-port-monitor
dargslan-win-port-monitor --json
```

### Python API
```python
from dargslan_win_port_monitor import PortMonitor

tool = PortMonitor()
report = tool.check()
print(report)
```

## Features

- `list_listening()` — List listening
- `check_well_known()` — Check well known
- `find_suspicious()` — Find suspicious
- `get_connections()` — Get connections

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
