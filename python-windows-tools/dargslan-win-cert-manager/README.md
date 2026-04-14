# dargslan-win-cert-manager

**Windows Certificate Store manager — certificate inventory, expiry, trust chain audit**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-cert-manager
```

## Usage

### Command Line
```bash
dargslan-win-cert-manager
dargslan-win-cert-manager --json
```

### Python API
```python
from dargslan_win_cert_manager import CertManager

tool = CertManager()
report = tool.full_audit()
print(report)
```

## Features

- `list_personal()` — List personal
- `list_root_ca()` — List root ca
- `check_expiring()` — Check expiring
- `check_web_hosting()` — Check web hosting
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
