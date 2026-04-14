# dargslan-win-disk-cleaner

**Windows Windows disk cleanup tool — temp files, recycle bin, Windows Update cache**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-disk-cleaner
```

## Usage

### Command Line
```bash
dargslan-win-disk-cleaner
dargslan-win-disk-cleaner --json
```

### Python API
```python
from dargslan_win_disk_cleaner import DiskCleaner

tool = DiskCleaner()
report = tool.check()
print(report)
```

## Features

- `clean_temp()` — Clean temp
- `clean_recycle_bin()` — Clean recycle bin
- `clean_update_cache()` — Clean update cache
- `analyze()` — Analyze

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
