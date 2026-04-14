# dargslan-win-cpu-freq

**Windows CPU performance monitor — clock speed, power plan, thermal throttling**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-cpu-freq
```

## Usage

### Command Line
```bash
dargslan-win-cpu-freq
dargslan-win-cpu-freq --json
```

### Python API
```python
from dargslan_win_cpu_freq import CpuPerformance

tool = CpuPerformance()
report = tool.full_audit()
print(report)
```

## Features

- `get_cpu_info()` — Get cpu info
- `get_power_plan()` — Get power plan
- `check_throttling()` — Check throttling
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
