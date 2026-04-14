# dargslan-win-process-killer

**Windows Windows process manager — kill by name/PID, find resource hogs, zombie cleanup**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-process-killer
```

## Usage

### Command Line
```bash
dargslan-win-process-killer
dargslan-win-process-killer --json
```

### Python API
```python
from dargslan_win_process_killer import ProcessKiller

tool = ProcessKiller()
report = tool.check()
print(report)
```

## Features

- `kill_by_name()` — Kill by name
- `kill_by_pid()` — Kill by pid
- `find_resource_hogs()` — Find resource hogs
- `find_not_responding()` — Find not responding

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
