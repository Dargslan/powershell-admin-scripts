# dargslan-win-cgroup-audit

**Windows Job Objects & process resource limits auditor — CPU affinity, memory limits**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-cgroup-audit
```

## Usage

### Command Line
```bash
dargslan-win-cgroup-audit
dargslan-win-cgroup-audit --json
```

### Python API
```python
from dargslan_win_cgroup_audit import ResourceLimitsAudit

tool = ResourceLimitsAudit()
report = tool.full_audit()
print(report)
```

## Features

- `check_cpu_affinity()` — Check cpu affinity
- `check_memory_limits()` — Check memory limits
- `list_job_objects()` — List job objects
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
