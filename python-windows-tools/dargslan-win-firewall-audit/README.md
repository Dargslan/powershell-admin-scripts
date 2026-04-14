# dargslan-win-firewall-audit

**Windows Windows Firewall auditor — rules, profiles, logging, inbound/outbound**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-firewall-audit
```

## Usage

### Command Line
```bash
dargslan-win-firewall-audit
dargslan-win-firewall-audit --json
```

### Python API
```python
from dargslan_win_firewall_audit import FirewallAudit

tool = FirewallAudit()
report = tool.check()
print(report)
```

## Features

- `list_rules()` — List rules
- `check_profiles()` — Check profiles
- `check_logging()` — Check logging
- `find_any_rules()` — Find any rules

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
