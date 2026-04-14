# dargslan-win-load-average

**Windows Windows system load & performance monitor — CPU queue, thread count**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-load-average
```

## Usage

### Command Line
```bash
dargslan-win-load-average
dargslan-win-load-average --json
```

### Python API
```python
from dargslan_win_load_average import SystemLoad

tool = SystemLoad()
report = tool.check()
print(report)
```

## Features

- `get_load()` — Get load
- `get_processor_queue()` — Get processor queue
- `get_thread_count()` — Get thread count
- `monitor()` — Monitor

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
