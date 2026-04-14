# dargslan-win-entropy-check

**Windows Windows random number generator & crypto entropy checker**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-entropy-check
```

## Usage

### Command Line
```bash
dargslan-win-entropy-check
dargslan-win-entropy-check --json
```

### Python API
```python
from dargslan_win_entropy_check import EntropyCheck

tool = EntropyCheck()
report = tool.check()
print(report)
```

## Features

- `check_rng()` — Check rng
- `check_crypto_provider()` — Check crypto provider
- `test_random()` — Test random

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
