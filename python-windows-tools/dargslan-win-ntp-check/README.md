# dargslan-win-ntp-check

**Windows Windows time synchronization checker — W32Time, NTP server, time skew**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ntp-check
```

## Usage

### Command Line
```bash
dargslan-win-ntp-check
dargslan-win-ntp-check --json
```

### Python API
```python
from dargslan_win_ntp_check import TimeSync

tool = TimeSync()
report = tool.check()
print(report)
```

## Features

- `check_w32time()` — Check w32time
- `get_ntp_source()` — Get ntp source
- `check_time_skew()` — Check time skew
- `check_config()` — Check config

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
