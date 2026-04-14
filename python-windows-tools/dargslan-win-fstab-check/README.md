# dargslan-win-fstab-check

**Windows Windows mount points & drive mapping checker — mapped drives, disk config**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-fstab-check
```

## Usage

### Command Line
```bash
dargslan-win-fstab-check
dargslan-win-fstab-check --json
```

### Python API
```python
from dargslan_win_fstab_check import MountPointCheck

tool = MountPointCheck()
report = tool.check()
print(report)
```

## Features

- `list_drives()` — List drives
- `check_mount_points()` — Check mount points
- `list_mapped_drives()` — List mapped drives

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
