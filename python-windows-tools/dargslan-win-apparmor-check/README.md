# dargslan-win-apparmor-check

**Windows Defender Application Control (WDAC) policy auditor**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-apparmor-check
```

## Usage

### Command Line
```bash
dargslan-win-apparmor-check
dargslan-win-apparmor-check --json
```

### Python API
```python
from dargslan_win_apparmor_check import WdacCheck

tool = WdacCheck()
report = tool.full_audit()
print(report)
```

## Features

- `check_applocker()` — Check applocker
- `check_wdac_policy()` — Check wdac policy
- `get_blocked_apps()` — Get blocked apps
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
