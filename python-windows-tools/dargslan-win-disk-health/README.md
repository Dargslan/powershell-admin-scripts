# dargslan-win-disk-health

**Windows Windows disk health monitor — SMART status, disk errors, reliability**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-disk-health
```

## Usage

### Command Line
```bash
dargslan-win-disk-health
dargslan-win-disk-health --json
```

### Python API
```python
from dargslan_win_disk_health import DiskHealth

tool = DiskHealth()
report = tool.check()
print(report)
```

## Features

- `check_smart()` — Check smart
- `check_errors()` — Check errors
- `get_reliability()` — Get reliability

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
