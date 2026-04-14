# dargslan-win-toolkit

**Windows Complete Windows sysadmin toolkit — meta-package installing all Dargslan Windows tools**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-toolkit
```

## Usage

### Command Line
```bash
dargslan-win-toolkit
dargslan-win-toolkit --json
```

### Python API
```python
from dargslan_win_toolkit import Toolkit

tool = Toolkit()
report = tool.check()
print(report)
```

## Features

- `list_tools()` — List tools
- `run_tool()` — Run tool
- `get_version()` — Get version

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
