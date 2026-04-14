# dargslan-win-iptables-export

**Windows Windows Firewall rule export tool — backup/restore firewall configuration**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-iptables-export
```

## Usage

### Command Line
```bash
dargslan-win-iptables-export
dargslan-win-iptables-export --json
```

### Python API
```python
from dargslan_win_iptables_export import FirewallExport

tool = FirewallExport()
report = tool.check()
print(report)
```

## Features

- `export_rules()` — Export rules
- `import_rules()` — Import rules
- `backup_all()` — Backup all

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
