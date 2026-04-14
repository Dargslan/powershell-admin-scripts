# dargslan-win-yum-history

**Windows Windows package update history — Windows Update log, hotfix history**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-yum-history
```

## Usage

### Command Line
```bash
dargslan-win-yum-history
dargslan-win-yum-history --json
```

### Python API
```python
from dargslan_win_yum_history import UpdateHistory

tool = UpdateHistory()
report = tool.check()
print(report)
```

## Features

- `get_hotfix_history()` — Get hotfix history
- `get_update_log()` — Get update log
- `get_driver_updates()` — Get driver updates
- `get_failed()` — Get failed

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
