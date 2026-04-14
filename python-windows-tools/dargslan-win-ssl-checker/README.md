# dargslan-win-ssl-checker

**Windows Windows SSL/TLS certificate checker — expiry, chain, protocols, cipher suites**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ssl-checker
```

## Usage

### Command Line
```bash
dargslan-win-ssl-checker
dargslan-win-ssl-checker --json
```

### Python API
```python
from dargslan_win_ssl_checker import SslChecker

tool = SslChecker()
report = tool.check()
print(report)
```

## Features

- `check_cert()` — Check cert
- `check_chain()` — Check chain
- `check_protocols()` — Check protocols
- `check_ciphers()` — Check ciphers

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
