# dargslan-win-hostname-info

**Windows Windows system hostname & identity information tool**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-hostname-info
```

## Usage

### Command Line
```bash
dargslan-win-hostname-info
dargslan-win-hostname-info --json
```

### Python API
```python
from dargslan_win_hostname_info import HostnameInfo

tool = HostnameInfo()
report = tool.check()
print(report)
```

## Features

- `get_info()` — Get info
- `get_fqdn()` — Get fqdn
- `get_domain_info()` — Get domain info

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
