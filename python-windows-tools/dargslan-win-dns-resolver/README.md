# dargslan-win-dns-resolver

**Windows Windows DNS resolver tool — DNS lookup, nslookup, record query**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-dns-resolver
```

## Usage

### Command Line
```bash
dargslan-win-dns-resolver
dargslan-win-dns-resolver --json
```

### Python API
```python
from dargslan_win_dns_resolver import DnsResolver

tool = DnsResolver()
report = tool.check()
print(report)
```

## Features

- `resolve_name()` — Resolve name
- `check_mx()` — Check mx
- `check_txt()` — Check txt
- `check_ns()` — Check ns

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
