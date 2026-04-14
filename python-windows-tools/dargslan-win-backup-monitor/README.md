# dargslan-win-backup-monitor

**Windows Backup monitor — Windows Server Backup, VSS snapshots, backup status**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-backup-monitor
```

## Usage

### Command Line
```bash
dargslan-win-backup-monitor
dargslan-win-backup-monitor --json
```

### Python API
```python
from dargslan_win_backup_monitor import BackupMonitor

tool = BackupMonitor()
report = tool.full_audit()
print(report)
```

## Features

- `check_wbadmin()` — Check wbadmin
- `list_shadow_copies()` — List shadow copies
- `check_backup_schedule()` — Check backup schedule
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
