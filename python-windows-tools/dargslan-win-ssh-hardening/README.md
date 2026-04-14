# dargslan-win-ssh-hardening

**Windows Windows OpenSSH hardening checker — security best practices, key types**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ssh-hardening
```

## Usage

### Command Line
```bash
dargslan-win-ssh-hardening
dargslan-win-ssh-hardening --json
```

### Python API
```python
from dargslan_win_ssh_hardening import SshHardening

tool = SshHardening()
report = tool.check()
print(report)
```

## Features

- `check_config()` — Check config
- `check_key_types()` — Check key types
- `check_auth()` — Check auth
- `get_recommendations()` — Get recommendations

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
