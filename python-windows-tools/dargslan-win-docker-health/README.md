# dargslan-win-docker-health

**Windows Windows Docker Desktop & container health checker**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-docker-health
```

## Usage

### Command Line
```bash
dargslan-win-docker-health
dargslan-win-docker-health --json
```

### Python API
```python
from dargslan_win_docker_health import DockerHealth

tool = DockerHealth()
report = tool.check()
print(report)
```

## Features

- `check_service()` — Check service
- `list_containers()` — List containers
- `check_resources()` — Check resources
- `check_wsl()` — Check wsl

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
