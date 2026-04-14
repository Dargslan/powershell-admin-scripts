# dargslan-win-timezone-info

**Windows Windows timezone information tool — current timezone, UTC offset, DST rules**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-timezone-info
```

## Usage

### Command Line
```bash
dargslan-win-timezone-info
dargslan-win-timezone-info --json
```

### Python API
```python
from dargslan_win_timezone_info import TimezoneInfo

tool = TimezoneInfo()
report = tool.check()
print(report)
```

## Features

- `get_timezone()` — Get timezone
- `check_dst()` — Check dst
- `list_timezones()` — List timezones
- `compare_times()` — Compare times

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
