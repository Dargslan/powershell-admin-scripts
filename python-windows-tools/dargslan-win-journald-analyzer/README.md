# dargslan-win-journald-analyzer

**Windows Windows Event Log analyzer — application, system, security log analysis**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-journald-analyzer
```

## Usage

### Command Line
```bash
dargslan-win-journald-analyzer
dargslan-win-journald-analyzer --json
```

### Python API
```python
from dargslan_win_journald_analyzer import EventLogAnalyzer

tool = EventLogAnalyzer()
report = tool.check()
print(report)
```

## Features

- `analyze_application()` — Analyze application
- `analyze_system()` — Analyze system
- `analyze_security()` — Analyze security
- `get_errors()` — Get errors

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
