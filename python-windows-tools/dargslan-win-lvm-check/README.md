# dargslan-win-lvm-check

**Windows Windows disk partition & volume manager — dynamic disks, partitions**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-lvm-check
```

## Usage

### Command Line
```bash
dargslan-win-lvm-check
dargslan-win-lvm-check --json
```

### Python API
```python
from dargslan_win_lvm_check import VolumeManager

tool = VolumeManager()
report = tool.check()
print(report)
```

## Features

- `list_partitions()` — List partitions
- `list_volumes()` — List volumes
- `check_dynamic_disks()` — Check dynamic disks

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
