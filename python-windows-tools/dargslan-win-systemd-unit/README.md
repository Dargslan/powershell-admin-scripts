# dargslan-win-systemd-unit

**Windows Windows service unit manager — service config, recovery, dependencies**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-systemd-unit
```

## Usage

### Command Line
```bash
dargslan-win-systemd-unit
dargslan-win-systemd-unit --json
```

### Python API
```python
from dargslan_win_systemd_unit import ServiceUnit

tool = ServiceUnit()
report = tool.check()
print(report)
```

## Features

- `get_config()` — Get config
- `check_recovery()` — Check recovery
- `list_dependencies()` — List dependencies
- `check_triggers()` — Check triggers

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
