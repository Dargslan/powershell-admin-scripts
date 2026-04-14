# dargslan-win-at-scheduler

**Windows Task Scheduler manager — scheduled tasks, triggers, actions, history**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-at-scheduler
```

## Usage

### Command Line
```bash
dargslan-win-at-scheduler
dargslan-win-at-scheduler --json
```

### Python API
```python
from dargslan_win_at_scheduler import TaskSchedulerManager

tool = TaskSchedulerManager()
report = tool.full_audit()
print(report)
```

## Features

- `list_tasks()` — List tasks
- `get_task_details()` — Get task details
- `check_failed()` — Check failed
- `get_running()` — Get running
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
