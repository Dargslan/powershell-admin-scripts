# dargslan-win-netfilter-check

**Windows Windows Filtering Platform (WFP) auditor — network filters, callouts**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-netfilter-check
```

## Usage

### Command Line
```bash
dargslan-win-netfilter-check
dargslan-win-netfilter-check --json
```

### Python API
```python
from dargslan_win_netfilter_check import WfpAudit

tool = WfpAudit()
report = tool.check()
print(report)
```

## Features

- `list_filters()` — List filters
- `check_callouts()` — Check callouts
- `get_provider_info()` — Get provider info

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
