# dargslan-win-ip-geo

**Windows IP geolocation lookup tool — works on Windows & Linux**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ip-geo
```

## Usage

### Command Line
```bash
dargslan-win-ip-geo
dargslan-win-ip-geo --json
```

### Python API
```python
from dargslan_win_ip_geo import IpGeo

tool = IpGeo()
report = tool.check()
print(report)
```

## Features

- `lookup()` — Lookup
- `get_public_ip()` — Get public ip
- `batch_lookup()` — Batch lookup

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
