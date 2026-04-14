# dargslan-win-snmp-check

**Windows Windows SNMP service checker — SNMP configuration, community strings, traps**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-snmp-check
```

## Usage

### Command Line
```bash
dargslan-win-snmp-check
dargslan-win-snmp-check --json
```

### Python API
```python
from dargslan_win_snmp_check import SnmpCheck

tool = SnmpCheck()
report = tool.check()
print(report)
```

## Features

- `check_service()` — Check service
- `get_config()` — Get config
- `check_communities()` — Check communities
- `check_traps()` — Check traps

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
