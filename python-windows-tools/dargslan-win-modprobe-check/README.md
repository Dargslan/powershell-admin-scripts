# dargslan-win-modprobe-check

**Windows Windows device driver manager — driver inventory, status, signing**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-modprobe-check
```

## Usage

### Command Line
```bash
dargslan-win-modprobe-check
dargslan-win-modprobe-check --json
```

### Python API
```python
from dargslan_win_modprobe_check import DeviceDriverCheck

tool = DeviceDriverCheck()
report = tool.check()
print(report)
```

## Features

- `list_loaded()` — List loaded
- `check_problem_devices()` — Check problem devices
- `verify_signing()` — Verify signing

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
