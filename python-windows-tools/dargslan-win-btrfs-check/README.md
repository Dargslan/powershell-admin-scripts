# dargslan-win-btrfs-check

**Windows Storage Spaces & ReFS health checker — pools, disks, volumes, resilience**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-btrfs-check
```

## Usage

### Command Line
```bash
dargslan-win-btrfs-check
dargslan-win-btrfs-check --json
```

### Python API
```python
from dargslan_win_btrfs_check import StorageSpacesCheck

tool = StorageSpacesCheck()
report = tool.full_audit()
print(report)
```

## Features

- `list_pools()` — List pools
- `list_disks()` — List disks
- `check_health()` — Check health
- `get_volumes()` — Get volumes
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
