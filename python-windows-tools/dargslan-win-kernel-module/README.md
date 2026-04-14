# dargslan-win-kernel-module

**Windows Windows driver & kernel module manager — loaded drivers, driver signing**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-kernel-module
```

## Usage

### Command Line
```bash
dargslan-win-kernel-module
dargslan-win-kernel-module --json
```

### Python API
```python
from dargslan_win_kernel_module import DriverManager

tool = DriverManager()
report = tool.check()
print(report)
```

## Features

- `list_drivers()` — List drivers
- `check_signing()` — Check signing
- `find_unsigned()` — Find unsigned
- `check_status()` — Check status

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
