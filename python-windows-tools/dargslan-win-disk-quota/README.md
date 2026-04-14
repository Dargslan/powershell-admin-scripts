# dargslan-win-disk-quota

**Windows Windows disk quota manager — NTFS quotas, user usage, limit configuration**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-disk-quota
```

## Usage

### Command Line
```bash
dargslan-win-disk-quota
dargslan-win-disk-quota --json
```

### Python API
```python
from dargslan_win_disk_quota import DiskQuota

tool = DiskQuota()
report = tool.check()
print(report)
```

## Features

- `list_quotas()` — List quotas
- `check_usage()` — Check usage
- `get_warnings()` — Get warnings

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
