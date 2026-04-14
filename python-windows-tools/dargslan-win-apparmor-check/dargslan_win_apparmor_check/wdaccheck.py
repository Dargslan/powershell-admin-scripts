"""
Windows Apparmor check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class WdacCheck:
    """Windows Defender Application Control auditor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def check_applocker(self):
        out = self._run_ps("Get-AppLockerPolicy -Effective -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RuleCollections | ConvertTo-Json -Depth 3")
        try: return json.loads(out) if out else {"status": "AppLocker not configured"}
        except: return {"status": "AppLocker not available"}
    def check_wdac_policy(self):
        out = self._run_ps("Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\\Microsoft\\Windows\\DeviceGuard -ErrorAction SilentlyContinue | Select-Object CodeIntegrityPolicyEnforcementStatus,UsermodeCodeIntegrityPolicyEnforcementStatus | ConvertTo-Json")
        try: return json.loads(out) if out else {"status": "WDAC not configured"}
        except: return {"status": "DeviceGuard not available"}
    def get_blocked_apps(self):
        out = self._run_ps("Get-WinEvent -LogName 'Microsoft-Windows-AppLocker/*' -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"applocker": self.check_applocker(), "wdac": self.check_wdac_policy(), "blocked": self.get_blocked_apps()}
