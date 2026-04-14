# dargslan-win-login-history

**Windows Windows user login history — logon/logoff events, RDP sessions**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-login-history
```

## Usage

### Command Line
```bash
dargslan-win-login-history
dargslan-win-login-history --json
```

### Python API
```python
from dargslan_win_login_history import LoginHistory

tool = LoginHistory()
report = tool.check()
print(report)
```

## Features

- `get_logon_history()` — Get logon history
- `get_rdp_sessions()` — Get rdp sessions
- `get_logoff_events()` — Get logoff events

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
