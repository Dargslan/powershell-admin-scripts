# dargslan-win-bridge-monitor

**Windows Hyper-V virtual switch & bridge monitor — vSwitch config, VLANs, adapters**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-bridge-monitor
```

## Usage

### Command Line
```bash
dargslan-win-bridge-monitor
dargslan-win-bridge-monitor --json
```

### Python API
```python
from dargslan_win_bridge_monitor import VirtualSwitchMonitor

tool = VirtualSwitchMonitor()
report = tool.full_audit()
print(report)
```

## Features

- `list_vswitches()` — List vswitches
- `get_vswitch_ports()` — Get vswitch ports
- `check_vlans()` — Check vlans
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
