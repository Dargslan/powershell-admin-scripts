# dargslan-win-container-audit

**Windows container & Docker Desktop auditor — running containers, images, security**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-container-audit
```

## Usage

### Command Line
```bash
dargslan-win-container-audit
dargslan-win-container-audit --json
```

### Python API
```python
from dargslan_win_container_audit import ContainerAudit

tool = ContainerAudit()
report = tool.full_audit()
print(report)
```

## Features

- `list_containers()` — List containers
- `list_images()` — List images
- `check_security()` — Check security
- `check_docker_config()` — Check docker config
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
