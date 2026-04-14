# dargslan-win-proc-monitor

**Windows Windows system process monitor — kernel processes, system services**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-proc-monitor
```

## Usage

### Command Line
```bash
dargslan-win-proc-monitor
dargslan-win-proc-monitor --json
```

### Python API
```python
from dargslan_win_proc_monitor import SystemProcessMonitor

tool = SystemProcessMonitor()
report = tool.check()
print(report)
```

## Features

- `list_system_processes()` — List system processes
- `check_critical()` — Check critical
- `monitor_services()` — Monitor services

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
