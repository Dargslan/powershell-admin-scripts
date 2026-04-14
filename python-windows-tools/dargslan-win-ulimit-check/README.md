# dargslan-win-ulimit-check

**Windows Windows process resource limit checker — handle count, memory limits, job quotas**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ulimit-check
```

## Usage

### Command Line
```bash
dargslan-win-ulimit-check
dargslan-win-ulimit-check --json
```

### Python API
```python
from dargslan_win_ulimit_check import ResourceLimitCheck

tool = ResourceLimitCheck()
report = tool.check()
print(report)
```

## Features

- `check_handle_limits()` — Check handle limits
- `check_memory_limits()` — Check memory limits
- `check_job_quotas()` — Check job quotas

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
