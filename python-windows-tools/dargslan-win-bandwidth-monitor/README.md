# dargslan-win-bandwidth-monitor

**Windows network bandwidth monitor — interface throughput, traffic stats, top connections**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-bandwidth-monitor
```

## Usage

### Command Line
```bash
dargslan-win-bandwidth-monitor
dargslan-win-bandwidth-monitor --json
```

### Python API
```python
from dargslan_win_bandwidth_monitor import BandwidthMonitor

tool = BandwidthMonitor()
report = tool.full_audit()
print(report)
```

## Features

- `get_interface_stats()` — Get interface stats
- `get_top_connections()` — Get top connections
- `measure_throughput()` — Measure throughput
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
