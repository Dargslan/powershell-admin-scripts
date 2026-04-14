# dargslan-win-locale-check

**Windows Windows locale & regional settings checker — language, keyboard, timezone**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-locale-check
```

## Usage

### Command Line
```bash
dargslan-win-locale-check
dargslan-win-locale-check --json
```

### Python API
```python
from dargslan_win_locale_check import LocaleCheck

tool = LocaleCheck()
report = tool.check()
print(report)
```

## Features

- `get_locale()` — Get locale
- `get_keyboard()` — Get keyboard
- `check_timezone()` — Check timezone
- `check_unicode()` — Check unicode

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
