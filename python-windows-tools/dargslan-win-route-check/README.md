# dargslan-win-route-check

**Windows Windows routing table checker — routes, gateways, persistent routes**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-route-check
```

## Usage

### Command Line
```bash
dargslan-win-route-check
dargslan-win-route-check --json
```

### Python API
```python
from dargslan_win_route_check import RouteCheck

tool = RouteCheck()
report = tool.check()
print(report)
```

## Features

- `get_routes()` — Get routes
- `check_gateway()` — Check gateway
- `list_persistent()` — List persistent
- `check_metrics()` — Check metrics

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
