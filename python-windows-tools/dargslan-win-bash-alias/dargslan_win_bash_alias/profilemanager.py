"""
Windows Bash alias — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, os

class ProfileManager:
    """Windows PowerShell profile & alias manager."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_aliases(self):
        out = self._run_ps("Get-Alias | Select-Object Name,Definition | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_profile(self):
        out = self._run_ps("$profiles = @{}; @('CurrentUserCurrentHost','CurrentUserAllHosts','AllUsersCurrentHost','AllUsersAllHosts') | ForEach-Object { $p = $PROFILE.$_; $profiles[$_] = @{Path=$p;Exists=(Test-Path $p)} }; $profiles | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def list_functions(self):
        out = self._run_ps("Get-ChildItem Function: | Where-Object {{ $_.Source -eq '' }} | Select-Object Name | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_env_path(self):
        return os.environ.get("PATH", "").split(";")
    def full_audit(self):
        return {"aliases": self.list_aliases()[:20], "profile": self.check_profile(), "path_entries": len(self.get_env_path())}
