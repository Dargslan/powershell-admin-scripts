# dargslan-win-ipv6-audit

**Windows Windows IPv6 configuration auditor — IPv6 status, tunnel adapters, privacy**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ipv6-audit
```

## Usage

### Command Line
```bash
dargslan-win-ipv6-audit
dargslan-win-ipv6-audit --json
```

### Python API
```python
from dargslan_win_ipv6_audit import Ipv6Audit

tool = Ipv6Audit()
report = tool.check()
print(report)
```

## Features

- `check_status()` — Check status
- `list_addresses()` — List addresses
- `check_tunnels()` — Check tunnels
- `check_privacy()` — Check privacy

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
