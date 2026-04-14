# dargslan-win-dns-check

**Windows Windows DNS configuration checker — DNS servers, cache, resolution, NRPT**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-dns-check
```

## Usage

### Command Line
```bash
dargslan-win-dns-check
dargslan-win-dns-check --json
```

### Python API
```python
from dargslan_win_dns_check import DnsCheck

tool = DnsCheck()
report = tool.check()
print(report)
```

## Features

- `check_config()` — Check config
- `test_resolution()` — Test resolution
- `check_cache()` — Check cache
- `get_nrpt()` — Get nrpt

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
