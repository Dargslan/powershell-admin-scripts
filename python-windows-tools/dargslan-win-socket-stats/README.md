# dargslan-win-socket-stats

**Windows Windows network socket statistics — TCP/UDP stats, connection states**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-socket-stats
```

## Usage

### Command Line
```bash
dargslan-win-socket-stats
dargslan-win-socket-stats --json
```

### Python API
```python
from dargslan_win_socket_stats import SocketStats

tool = SocketStats()
report = tool.check()
print(report)
```

## Features

- `get_tcp_stats()` — Get tcp stats
- `get_udp_stats()` — Get udp stats
- `get_connection_states()` — Get connection states
- `check_time_waits()` — Check time waits

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
