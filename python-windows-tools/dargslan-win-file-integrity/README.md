# dargslan-win-file-integrity

**Windows Windows file integrity monitor — hash verification, change detection**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-file-integrity
```

## Usage

### Command Line
```bash
dargslan-win-file-integrity
dargslan-win-file-integrity --json
```

### Python API
```python
from dargslan_win_file_integrity import FileIntegrity

tool = FileIntegrity()
report = tool.check()
print(report)
```

## Features

- `hash_directory()` — Hash directory
- `compare_hashes()` — Compare hashes
- `check_system_files()` — Check system files

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
