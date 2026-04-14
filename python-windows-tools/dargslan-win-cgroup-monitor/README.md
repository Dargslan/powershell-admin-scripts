# dargslan-win-cgroup-monitor

**Windows process resource monitor — per-process CPU, memory, I/O tracking**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-cgroup-monitor
```

## Usage

### Command Line
```bash
dargslan-win-cgroup-monitor
dargslan-win-cgroup-monitor --json
```

### Python API
```python
from dargslan_win_cgroup_monitor import ProcessResourceMonitor

tool = ProcessResourceMonitor()
report = tool.full_audit()
print(report)
```

## Features

- `top_cpu()` — Top cpu
- `top_memory()` — Top memory
- `top_io()` — Top io
- `get_system_usage()` — Get system usage
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
