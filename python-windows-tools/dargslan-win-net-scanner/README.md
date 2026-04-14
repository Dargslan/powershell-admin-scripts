# dargslan-win-net-scanner

**Windows Windows network scanner — ping sweep, port scan, service detection**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-net-scanner
```

## Usage

### Command Line
```bash
dargslan-win-net-scanner
dargslan-win-net-scanner --json
```

### Python API
```python
from dargslan_win_net_scanner import NetScanner

tool = NetScanner()
report = tool.check()
print(report)
```

## Features

- `ping_sweep()` — Ping sweep
- `port_scan()` — Port scan
- `detect_services()` — Detect services
- `scan_subnet()` — Scan subnet

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
