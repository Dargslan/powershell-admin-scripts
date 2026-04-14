# dargslan-win-tmpfile-cleaner

**Windows Windows advanced temp file cleaner — WinSxS, installer cache, logs**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-tmpfile-cleaner
```

## Usage

### Command Line
```bash
dargslan-win-tmpfile-cleaner
dargslan-win-tmpfile-cleaner --json
```

### Python API
```python
from dargslan_win_tmpfile_cleaner import AdvancedCleaner

tool = AdvancedCleaner()
report = tool.check()
print(report)
```

## Features

- `clean_winsxs()` — Clean winsxs
- `clean_installer()` — Clean installer
- `clean_logs()` — Clean logs
- `full_cleanup()` — Full cleanup

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
