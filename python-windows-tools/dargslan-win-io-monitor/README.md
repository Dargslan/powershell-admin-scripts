# dargslan-win-io-monitor

**Windows Windows disk I/O monitor — read/write rates, queue depth, latency**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-io-monitor
```

## Usage

### Command Line
```bash
dargslan-win-io-monitor
dargslan-win-io-monitor --json
```

### Python API
```python
from dargslan_win_io_monitor import IoMonitor

tool = IoMonitor()
report = tool.check()
print(report)
```

## Features

- `get_disk_io()` — Get disk io
- `get_process_io()` — Get process io
- `check_queue_depth()` — Check queue depth

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
