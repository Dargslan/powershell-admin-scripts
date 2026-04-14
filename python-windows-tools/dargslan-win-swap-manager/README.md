# dargslan-win-swap-manager

**Windows Windows page file manager — size configuration, automatic management**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-swap-manager
```

## Usage

### Command Line
```bash
dargslan-win-swap-manager
dargslan-win-swap-manager --json
```

### Python API
```python
from dargslan_win_swap_manager import PageFileManager

tool = PageFileManager()
report = tool.check()
print(report)
```

## Features

- `get_config()` — Get config
- `check_auto_manage()` — Check auto manage
- `check_size()` — Check size
- `recommend_size()` — Recommend size

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
