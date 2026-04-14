# dargslan-win-zombie-kill

**Windows Windows hung process killer — not responding, ghost processes, cleanup**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-zombie-kill
```

## Usage

### Command Line
```bash
dargslan-win-zombie-kill
dargslan-win-zombie-kill --json
```

### Python API
```python
from dargslan_win_zombie_kill import ZombieKill

tool = ZombieKill()
report = tool.check()
print(report)
```

## Features

- `find_not_responding()` — Find not responding
- `kill_hung()` — Kill hung
- `find_ghost_processes()` — Find ghost processes
- `cleanup()` — Cleanup

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
