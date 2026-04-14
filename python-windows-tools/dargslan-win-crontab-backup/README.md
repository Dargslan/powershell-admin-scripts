# dargslan-win-crontab-backup

**Windows Windows Task Scheduler backup & export — task XML export/import**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-crontab-backup
```

## Usage

### Command Line
```bash
dargslan-win-crontab-backup
dargslan-win-crontab-backup --json
```

### Python API
```python
from dargslan_win_crontab_backup import TaskSchedulerBackup

tool = TaskSchedulerBackup()
report = tool.check()
print(report)
```

## Features

- `export_all()` — Export all
- `export_task()` — Export task
- `list_backups()` — List backups

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
