# dargslan-win-log-rotate

**Windows Windows log rotation manager — IIS logs, event logs, application logs**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-log-rotate
```

## Usage

### Command Line
```bash
dargslan-win-log-rotate
dargslan-win-log-rotate --json
```

### Python API
```python
from dargslan_win_log_rotate import LogRotation

tool = LogRotation()
report = tool.check()
print(report)
```

## Features

- `check_iis_logs()` — Check iis logs
- `clean_old_logs()` — Clean old logs
- `check_event_log_size()` — Check event log size
- `compress_logs()` — Compress logs

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
