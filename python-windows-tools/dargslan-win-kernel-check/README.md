# dargslan-win-kernel-check

**Windows Windows OS & kernel version checker — build info, feature updates**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-kernel-check
```

## Usage

### Command Line
```bash
dargslan-win-kernel-check
dargslan-win-kernel-check --json
```

### Python API
```python
from dargslan_win_kernel_check import WindowsVersionCheck

tool = WindowsVersionCheck()
report = tool.check()
print(report)
```

## Features

- `get_version()` — Get version
- `check_updates()` — Check updates
- `get_build_info()` — Get build info

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
