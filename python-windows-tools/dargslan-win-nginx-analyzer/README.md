# dargslan-win-nginx-analyzer

**Windows Windows IIS configuration analyzer — URL rewrite, compression, security**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-nginx-analyzer
```

## Usage

### Command Line
```bash
dargslan-win-nginx-analyzer
dargslan-win-nginx-analyzer --json
```

### Python API
```python
from dargslan_win_nginx_analyzer import IisConfigAnalyzer

tool = IisConfigAnalyzer()
report = tool.check()
print(report)
```

## Features

- `check_url_rewrite()` — Check url rewrite
- `check_compression()` — Check compression
- `check_security_headers()` — Check security headers
- `check_ssl()` — Check ssl

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
