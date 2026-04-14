# dargslan-win-package-audit

**Windows Windows installed software auditor — vulnerable packages, outdated software**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-package-audit
```

## Usage

### Command Line
```bash
dargslan-win-package-audit
dargslan-win-package-audit --json
```

### Python API
```python
from dargslan_win_package_audit import SoftwareAudit

tool = SoftwareAudit()
report = tool.check()
print(report)
```

## Features

- `list_installed()` — List installed
- `find_outdated()` — Find outdated
- `check_uninstallable()` — Check uninstallable
- `check_startup()` — Check startup

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
