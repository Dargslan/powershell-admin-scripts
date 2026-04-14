# dargslan-win-apt-history

**Windows software installation history — installed programs, MSI logs, uninstall tracking**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-apt-history
```

## Usage

### Command Line
```bash
dargslan-win-apt-history
dargslan-win-apt-history --json
```

### Python API
```python
from dargslan_win_apt_history import SoftwareHistory

tool = SoftwareHistory()
report = tool.full_audit()
print(report)
```

## Features

- `list_installed()` — List installed
- `recent_installs()` — Recent installs
- `recent_uninstalls()` — Recent uninstalls
- `check_msi_logs()` — Check msi logs
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
