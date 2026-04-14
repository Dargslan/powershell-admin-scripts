# dargslan-win-disk-benchmark

**Windows Windows disk performance benchmark — read/write speed, IOPS testing**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-disk-benchmark
```

## Usage

### Command Line
```bash
dargslan-win-disk-benchmark
dargslan-win-disk-benchmark --json
```

### Python API
```python
from dargslan_win_disk_benchmark import DiskBenchmark

tool = DiskBenchmark()
report = tool.check()
print(report)
```

## Features

- `test_read_speed()` — Test read speed
- `test_write_speed()` — Test write speed
- `run_benchmark()` — Run benchmark

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
