# dargslan-win-apache-analyzer

**Windows IIS web server analyzer — application pools, sites, bindings, SSL configuration**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-apache-analyzer
```

## Usage

### Command Line
```bash
dargslan-win-apache-analyzer
dargslan-win-apache-analyzer --json
```

### Python API
```python
from dargslan_win_apache_analyzer import IisAnalyzer

tool = IisAnalyzer()
report = tool.full_audit()
print(report)
```

## Features

- `list_sites()` — List sites
- `list_app_pools()` — List app pools
- `check_bindings()` — Check bindings
- `check_ssl()` — Check ssl
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
