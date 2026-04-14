# dargslan-win-selinux-check

**Windows Windows Mandatory Integrity Control (MIC) checker — integrity levels, UAC**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-selinux-check
```

## Usage

### Command Line
```bash
dargslan-win-selinux-check
dargslan-win-selinux-check --json
```

### Python API
```python
from dargslan_win_selinux_check import IntegrityControl

tool = IntegrityControl()
report = tool.check()
print(report)
```

## Features

- `check_uac()` — Check uac
- `get_integrity_levels()` — Get integrity levels
- `check_protected_mode()` — Check protected mode

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
