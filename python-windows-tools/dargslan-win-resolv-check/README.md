# dargslan-win-resolv-check

**Windows Windows DNS client configuration checker — DNS servers, suffix search list**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-resolv-check
```

## Usage

### Command Line
```bash
dargslan-win-resolv-check
dargslan-win-resolv-check --json
```

### Python API
```python
from dargslan_win_resolv_check import DnsClientCheck

tool = DnsClientCheck()
report = tool.check()
print(report)
```

## Features

- `get_dns_servers()` — Get dns servers
- `check_suffix_list()` — Check suffix list
- `check_nrpt()` — Check nrpt
- `test_resolution()` — Test resolution

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
