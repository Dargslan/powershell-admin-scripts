# dargslan-win-security-scan

**Windows Windows security scanner — Defender status, firewall, updates, configuration**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-security-scan
```

## Usage

### Command Line
```bash
dargslan-win-security-scan
dargslan-win-security-scan --json
```

### Python API
```python
from dargslan_win_security_scan import SecurityScan

tool = SecurityScan()
report = tool.check()
print(report)
```

## Features

- `check_defender()` — Check defender
- `check_firewall()` — Check firewall
- `check_updates()` — Check updates
- `check_uac()` — Check uac
- `full_scan()` — Full scan

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
