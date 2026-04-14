# dargslan-win-swap-analyzer

**Windows Windows page file analyzer — size, usage, performance impact**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-swap-analyzer
```

## Usage

### Command Line
```bash
dargslan-win-swap-analyzer
dargslan-win-swap-analyzer --json
```

### Python API
```python
from dargslan_win_swap_analyzer import PageFileAnalyzer

tool = PageFileAnalyzer()
report = tool.check()
print(report)
```

## Features

- `check_size()` — Check size
- `check_usage()` — Check usage
- `check_config()` — Check config
- `get_recommendations()` — Get recommendations

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
