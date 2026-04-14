# dargslan-win-xfs-check

**Windows Windows ReFS filesystem checker — ReFS integrity, metadata, optimization**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-xfs-check
```

## Usage

### Command Line
```bash
dargslan-win-xfs-check
dargslan-win-xfs-check --json
```

### Python API
```python
from dargslan_win_xfs_check import ReFsCheck

tool = ReFsCheck()
report = tool.check()
print(report)
```

## Features

- `check_integrity()` — Check integrity
- `get_metadata()` — Get metadata
- `check_optimization()` — Check optimization
- `scan_volumes()` — Scan volumes

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
