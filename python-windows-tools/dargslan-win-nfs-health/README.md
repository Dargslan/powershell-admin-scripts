# dargslan-win-nfs-health

**Windows Windows SMB/CIFS share health checker — share status, sessions, open files**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-nfs-health
```

## Usage

### Command Line
```bash
dargslan-win-nfs-health
dargslan-win-nfs-health --json
```

### Python API
```python
from dargslan_win_nfs_health import SmbHealth

tool = SmbHealth()
report = tool.check()
print(report)
```

## Features

- `check_shares()` — Check shares
- `list_sessions()` — List sessions
- `list_open_files()` — List open files
- `check_config()` — Check config

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
