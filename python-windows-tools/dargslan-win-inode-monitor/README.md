# dargslan-win-inode-monitor

**Windows Windows MFT & file system metadata monitor — NTFS metadata, file counts**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-inode-monitor
```

## Usage

### Command Line
```bash
dargslan-win-inode-monitor
dargslan-win-inode-monitor --json
```

### Python API
```python
from dargslan_win_inode_monitor import MftMonitor

tool = MftMonitor()
report = tool.check()
print(report)
```

## Features

- `check_mft_size()` — Check mft size
- `count_files()` — Count files
- `check_fragmentation()` — Check fragmentation

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
