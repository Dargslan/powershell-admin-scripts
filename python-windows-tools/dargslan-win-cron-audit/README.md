# dargslan-win-cron-audit

**Windows Task Scheduler audit — security review, privileged tasks, trigger analysis**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-cron-audit
```

## Usage

### Command Line
```bash
dargslan-win-cron-audit
dargslan-win-cron-audit --json
```

### Python API
```python
from dargslan_win_cron_audit import TaskSchedulerAudit

tool = TaskSchedulerAudit()
report = tool.full_audit()
print(report)
```

## Features

- `list_system_tasks()` — List system tasks
- `find_privileged()` — Find privileged
- `check_triggers()` — Check triggers
- `find_disabled()` — Find disabled
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
