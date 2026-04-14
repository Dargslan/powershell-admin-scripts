# dargslan-win-thermal-monitor

**Windows Windows thermal & temperature monitor — CPU temp, fan speed, thermal events**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-thermal-monitor
```

## Usage

### Command Line
```bash
dargslan-win-thermal-monitor
dargslan-win-thermal-monitor --json
```

### Python API
```python
from dargslan_win_thermal_monitor import ThermalMonitor

tool = ThermalMonitor()
report = tool.check()
print(report)
```

## Features

- `check_temperature()` — Check temperature
- `check_thermal_zone()` — Check thermal zone
- `get_fan_info()` — Get fan info
- `check_events()` — Check events

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
