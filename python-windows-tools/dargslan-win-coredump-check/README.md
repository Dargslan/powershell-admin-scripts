# dargslan-win-coredump-check

**Windows crash dump analyzer — BSOD dumps, WER reports, application crashes**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-coredump-check
```

## Usage

### Command Line
```bash
dargslan-win-coredump-check
dargslan-win-coredump-check --json
```

### Python API
```python
from dargslan_win_coredump_check import CrashDumpCheck

tool = CrashDumpCheck()
report = tool.full_audit()
print(report)
```

## Features

- `list_minidumps()` — List minidumps
- `check_wer_reports()` — Check wer reports
- `check_bsod_events()` — Check bsod events
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
