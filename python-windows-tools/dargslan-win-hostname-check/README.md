# dargslan-win-hostname-check

**Windows Windows hostname & domain configuration checker**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-hostname-check
```

## Usage

### Command Line
```bash
dargslan-win-hostname-check
dargslan-win-hostname-check --json
```

### Python API
```python
from dargslan_win_hostname_check import HostnameCheck

tool = HostnameCheck()
report = tool.check()
print(report)
```

## Features

- `get_hostname()` — Get hostname
- `check_domain()` — Check domain
- `check_dns_suffix()` — Check dns suffix
- `check_wins()` — Check wins

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
