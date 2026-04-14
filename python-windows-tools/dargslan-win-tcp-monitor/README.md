# dargslan-win-tcp-monitor

**Windows Windows TCP connection monitor — active connections, states, remote endpoints**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-tcp-monitor
```

## Usage

### Command Line
```bash
dargslan-win-tcp-monitor
dargslan-win-tcp-monitor --json
```

### Python API
```python
from dargslan_win_tcp_monitor import TcpMonitor

tool = TcpMonitor()
report = tool.check()
print(report)
```

## Features

- `list_connections()` — List connections
- `check_states()` — Check states
- `find_remote()` — Find remote
- `monitor_changes()` — Monitor changes

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
