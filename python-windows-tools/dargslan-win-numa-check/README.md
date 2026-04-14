# dargslan-win-numa-check

**Windows Windows NUMA topology checker — node configuration, memory distribution**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-numa-check
```

## Usage

### Command Line
```bash
dargslan-win-numa-check
dargslan-win-numa-check --json
```

### Python API
```python
from dargslan_win_numa_check import NumaCheck

tool = NumaCheck()
report = tool.check()
print(report)
```

## Features

- `get_topology()` — Get topology
- `check_memory_distribution()` — Check memory distribution
- `check_cpu_assignment()` — Check cpu assignment

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
