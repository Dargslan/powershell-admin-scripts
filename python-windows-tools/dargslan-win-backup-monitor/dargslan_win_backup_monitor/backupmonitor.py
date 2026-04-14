"""
Windows Backup monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class BackupMonitor:
    """Windows Backup status monitor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def check_wbadmin(self):
        out = self._run_ps("wbadmin get status 2>&1")
        versions = self._run_ps("wbadmin get versions -backupTarget:$null 2>&1 | Select-String 'Version identifier' | Select-Object -Last 5")
        return {"status": out[:500] if out else "WBAdmin not available", "recent_versions": versions}
    def list_shadow_copies(self):
        out = self._run_ps("Get-CimInstance Win32_ShadowCopy | Select-Object ID,InstallDate,VolumeName,@{{N='SizeGB';E={{[math]::Round($_.Count/1GB,2)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_backup_schedule(self):
        out = self._run_ps("Get-ScheduledTask -TaskPath '\\Microsoft\\Windows\\Backup\\*' -ErrorAction SilentlyContinue | Select-Object TaskName,State | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"wbadmin": self.check_wbadmin(), "shadow_copies": self.list_shadow_copies(), "schedule": self.check_backup_schedule()}
