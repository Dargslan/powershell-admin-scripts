# dargslan-win-pam-audit

**Windows Windows authentication policy auditor — credential providers, MFA, smart card**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-pam-audit
```

## Usage

### Command Line
```bash
dargslan-win-pam-audit
dargslan-win-pam-audit --json
```

### Python API
```python
from dargslan_win_pam_audit import AuthPolicyAudit

tool = AuthPolicyAudit()
report = tool.check()
print(report)
```

## Features

- `check_credential_providers()` — Check credential providers
- `check_smart_card()` — Check smart card
- `check_mfa()` — Check mfa
- `check_password_policy()` — Check password policy

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
