# dargslan-win-bonding-check

**Windows NIC Teaming checker — team status, load balancing, failover configuration**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-bonding-check
```

## Usage

### Command Line
```bash
dargslan-win-bonding-check
dargslan-win-bonding-check --json
```

### Python API
```python
from dargslan_win_bonding_check import NicTeamingCheck

tool = NicTeamingCheck()
report = tool.full_audit()
print(report)
```

## Features

- `list_teams()` — List teams
- `get_team_members()` — Get team members
- `check_status()` — Check status
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
