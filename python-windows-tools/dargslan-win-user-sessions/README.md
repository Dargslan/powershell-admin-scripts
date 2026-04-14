# dargslan-win-user-sessions

**Windows Windows user session monitor — active sessions, RDP, logged-in users**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-user-sessions
```

## Usage

### Command Line
```bash
dargslan-win-user-sessions
dargslan-win-user-sessions --json
```

### Python API
```python
from dargslan_win_user_sessions import UserSessions

tool = UserSessions()
report = tool.check()
print(report)
```

## Features

- `get_active()` — Get active
- `list_rdp()` — List rdp
- `check_disconnected()` — Check disconnected
- `get_logon_type()` — Get logon type

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
