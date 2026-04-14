# dargslan-win-crypt-audit

**Windows Windows BitLocker & encryption auditor — drive encryption status, TPM, recovery keys**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-crypt-audit
```

## Usage

### Command Line
```bash
dargslan-win-crypt-audit
dargslan-win-crypt-audit --json
```

### Python API
```python
from dargslan_win_crypt_audit import BitLockerAudit

tool = BitLockerAudit()
report = tool.check()
print(report)
```

## Features

- `check_bitlocker()` — Check bitlocker
- `check_tpm()` — Check tpm
- `get_recovery_keys()` — Get recovery keys

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
