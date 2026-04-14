# dargslan-win-sysinfo

**Windows Windows system information tool — hardware, OS, CPU, memory, disk, network**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-sysinfo
```

## Usage

### Command Line
```bash
dargslan-win-sysinfo
dargslan-win-sysinfo --json
```

### Python API
```python
from dargslan_win_sysinfo import SystemInfo

tool = SystemInfo()
report = tool.check()
print(report)
```

## Features

- `get_os()` — Get os
- `get_cpu()` — Get cpu
- `get_memory()` — Get memory
- `get_disk()` — Get disk
- `get_network()` — Get network
- `full_report()` — Full report

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
