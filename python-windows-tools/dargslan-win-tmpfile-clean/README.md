# dargslan-win-tmpfile-clean

**Windows Windows temporary file cleaner — temp dirs, browser cache, system cleanup**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-tmpfile-clean
```

## Usage

### Command Line
```bash
dargslan-win-tmpfile-clean
dargslan-win-tmpfile-clean --json
```

### Python API
```python
from dargslan_win_tmpfile_clean import TempCleaner

tool = TempCleaner()
report = tool.check()
print(report)
```

## Features

- `analyze_temp()` — Analyze temp
- `clean_temp()` — Clean temp
- `clean_browser_cache()` — Clean browser cache
- `clean_windows_temp()` — Clean windows temp

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
