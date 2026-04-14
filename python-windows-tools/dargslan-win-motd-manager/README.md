# dargslan-win-motd-manager

**Windows Windows logon message & legal notice manager — interactive logon messages**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-motd-manager
```

## Usage

### Command Line
```bash
dargslan-win-motd-manager
dargslan-win-motd-manager --json
```

### Python API
```python
from dargslan_win_motd_manager import LogonMessageManager

tool = LogonMessageManager()
report = tool.check()
print(report)
```

## Features

- `get_current_message()` — Get current message
- `get_legal_notice()` — Get legal notice
- `check_policy()` — Check policy

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
