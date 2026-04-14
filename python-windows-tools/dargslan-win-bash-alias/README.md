# dargslan-win-bash-alias

**Windows PowerShell profile & alias manager — PS profiles, aliases, functions, environment**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-bash-alias
```

## Usage

### Command Line
```bash
dargslan-win-bash-alias
dargslan-win-bash-alias --json
```

### Python API
```python
from dargslan_win_bash_alias import ProfileManager

tool = ProfileManager()
report = tool.full_audit()
print(report)
```

## Features

- `list_aliases()` — List aliases
- `check_profile()` — Check profile
- `list_functions()` — List functions
- `get_env_path()` — Get env path
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
