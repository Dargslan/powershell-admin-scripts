# dargslan-win-lsof-audit

**Windows Windows open file & handle auditor — process handles, file locks**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-lsof-audit
```

## Usage

### Command Line
```bash
dargslan-win-lsof-audit
dargslan-win-lsof-audit --json
```

### Python API
```python
from dargslan_win_lsof_audit import HandleAudit

tool = HandleAudit()
report = tool.check()
print(report)
```

## Features

- `list_handles()` — List handles
- `find_locked_files()` — Find locked files
- `get_process_files()` — Get process files

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
