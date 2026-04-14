"""
Windows Apt check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class WindowsUpdateCheck:
    """Windows Update status checker."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=60)
            return r.stdout.strip()
        except Exception: return ""
    def check_pending(self):
        out = self._run_ps("$u = New-Object -ComObject Microsoft.Update.Session; $s = $u.CreateUpdateSearcher(); $r = $s.Search('IsInstalled=0'); $r.Updates | Select-Object Title,MsrcSeverity,LastDeploymentChangeTime | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return [{"note": out[:200] if out else "No pending updates or COM error"}]
    def get_history(self, count=20):
        out = self._run_ps(f"Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First {count} HotFixID,Description,InstalledOn,InstalledBy | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_wsus(self):
        out = self._run_ps("Get-ItemProperty -Path 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate' -ErrorAction SilentlyContinue | Select-Object WUServer,WUStatusServer,TargetGroup | ConvertTo-Json")
        try: return json.loads(out) if out else {"wsus": "Not configured"}
        except: return {"wsus": "Not configured"}
    def get_last_update(self):
        out = self._run_ps("Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1 HotFixID,InstalledOn | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def full_audit(self):
        return {"pending": self.check_pending(), "history": self.get_history(), "wsus": self.check_wsus(), "last_update": self.get_last_update()}
