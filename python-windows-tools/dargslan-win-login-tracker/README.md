# dargslan-win-login-tracker

**Windows Windows real-time login tracker — active sessions, interactive logons**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-login-tracker
```

## Usage

### Command Line
```bash
dargslan-win-login-tracker
dargslan-win-login-tracker --json
```

### Python API
```python
from dargslan_win_login_tracker import LoginTracker

tool = LoginTracker()
report = tool.check()
print(report)
```

## Features

- `get_active_sessions()` — Get active sessions
- `track_logons()` — Track logons
- `get_session_info()` — Get session info

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
