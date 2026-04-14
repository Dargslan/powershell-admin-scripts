# dargslan-win-memory-profiler

**Windows Windows memory profiler — per-process memory, page file, working set**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-memory-profiler
```

## Usage

### Command Line
```bash
dargslan-win-memory-profiler
dargslan-win-memory-profiler --json
```

### Python API
```python
from dargslan_win_memory_profiler import MemoryProfiler

tool = MemoryProfiler()
report = tool.check()
print(report)
```

## Features

- `profile_processes()` — Profile processes
- `check_page_file()` — Check page file
- `check_working_sets()` — Check working sets
- `find_leaks()` — Find leaks

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
