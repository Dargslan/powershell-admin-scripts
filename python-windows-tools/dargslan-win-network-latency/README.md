# dargslan-win-network-latency

**Windows Windows network latency tester — ping, traceroute, connection quality**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-network-latency
```

## Usage

### Command Line
```bash
dargslan-win-network-latency
dargslan-win-network-latency --json
```

### Python API
```python
from dargslan_win_network_latency import NetworkLatency

tool = NetworkLatency()
report = tool.check()
print(report)
```

## Features

- `ping_test()` — Ping test
- `traceroute()` — Traceroute
- `test_dns_latency()` — Test dns latency
- `measure_jitter()` — Measure jitter

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
