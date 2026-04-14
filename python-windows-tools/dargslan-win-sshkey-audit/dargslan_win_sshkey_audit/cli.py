"""
CLI interface for dargslan-win-sshkey-audit.

Usage:
    dargslan-win-sshkey-audit          Run full audit
    dargslan-win-sshkey-audit --json   JSON output

More tools at https://dargslan.com
"""

import argparse
import json
import sys

from dargslan_win_sshkey_audit.sshkeyaudit import SshKeyAudit


def main():
    parser = argparse.ArgumentParser(
        description="Windows Windows SSH key auditor — authorized keys, key strength, key management — dargslan.com",
        epilog="More Windows & DevOps tools at https://dargslan.com",
    )
    parser.add_argument("--json", action="store_true", help="Output as JSON")
    parser.add_argument("--version", action="version", version="dargslan-win-sshkey-audit 1.0.0")

    args = parser.parse_args()
    tool = SshKeyAudit()

    print("""
╔══════════════════════════════════════════════════════════╗
║  Dargslan Windows Admin Tools                            ║
║  Tool: dargslan-win-sshkey-audit               ║
║  More tools: https://dargslan.com                        ║
║  Free Cheat Sheets: https://dargslan.com/cheat-sheets    ║
╚══════════════════════════════════════════════════════════╝
""")

    report = tool.check()

    if args.json:
        print(json.dumps(report, indent=2, default=str))
    else:
        for key, value in report.items():
            print(f"\n  [{key.upper()}]")
            if isinstance(value, list):
                for item in value[:10]:
                    if isinstance(item, dict):
                        for k, v in item.items():
                            print(f"    {k}: {v}")
                        print()
                    else:
                        print(f"    {item}")
            elif isinstance(value, dict):
                for k, v in value.items():
                    print(f"    {k}: {v}")
            else:
                print(f"    {value}")

        print("\n" + "-" * 60)
        print("  dargslan.com — Windows Admin Tools & eBooks")
        print("=" * 60 + "\n")


if __name__ == "__main__":
    main()
