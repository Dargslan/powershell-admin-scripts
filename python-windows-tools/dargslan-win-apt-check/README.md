# dargslan-win-apt-check

**Windows Update checker — pending updates, update history, WSUS status**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-apt-check
```

## Usage

### Command Line
```bash
dargslan-win-apt-check
dargslan-win-apt-check --json
```

### Python API
```python
from dargslan_win_apt_check import WindowsUpdateCheck

tool = WindowsUpdateCheck()
report = tool.full_audit()
print(report)
```

## Features

- `check_pending()` — Check pending
- `get_history()` — Get history
- `check_wsus()` — Check wsus
- `get_last_update()` — Get last update
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
