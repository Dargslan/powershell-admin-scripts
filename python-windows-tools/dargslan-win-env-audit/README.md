# dargslan-win-env-audit

**Windows Windows environment variables auditor — system/user vars, PATH analysis**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-env-audit
```

## Usage

### Command Line
```bash
dargslan-win-env-audit
dargslan-win-env-audit --json
```

### Python API
```python
from dargslan_win_env_audit import EnvAudit

tool = EnvAudit()
report = tool.check()
print(report)
```

## Features

- `list_system_vars()` — List system vars
- `list_user_vars()` — List user vars
- `audit_path()` — Audit path
- `find_issues()` — Find issues

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
