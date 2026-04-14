# dargslan-win-grub-check

**Windows Windows Boot Configuration (BCD) checker — boot entries, recovery, secure boot**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-grub-check
```

## Usage

### Command Line
```bash
dargslan-win-grub-check
dargslan-win-grub-check --json
```

### Python API
```python
from dargslan_win_grub_check import BootConfigCheck

tool = BootConfigCheck()
report = tool.check()
print(report)
```

## Features

- `get_bcd()` — Get bcd
- `check_secure_boot()` — Check secure boot
- `check_recovery()` — Check recovery
- `check_uefi()` — Check uefi

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
