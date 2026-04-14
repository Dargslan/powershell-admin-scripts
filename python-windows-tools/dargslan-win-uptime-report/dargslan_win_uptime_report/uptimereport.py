"""
Windows Uptime report — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class UptimeReport:
    """Windows uptime report — system uptime, last boot, restart history."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def get_uptime(self):
        out = self._run_ps("$os = Get-CimInstance Win32_OperatingSystem; [PSCustomObject]@{LastBoot=$os.LastBootUpTime.ToString();UptimeDays=[math]::Round(((Get-Date)-$os.LastBootUpTime).TotalDays,1);UptimeHours=[math]::Round(((Get-Date)-$os.LastBootUpTime).TotalHours,1)} | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def get_last_boot(self):
        out = self._run_ps("(Get-CimInstance Win32_OperatingSystem).LastBootUpTime.ToString('yyyy-MM-dd HH:mm:ss')")
        return {"last_boot": out}
    def get_restart_history(self, count=10):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='System';ID=6005,6006,6008,6009,1074}} -MaxEvents {count} -ErrorAction SilentlyContinue | Select-Object TimeCreated,Id,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_planned(self):
        out = self._run_ps("Get-WinEvent -FilterHashtable @{LogName='System';ID=1074} -MaxEvents 5 -ErrorAction SilentlyContinue | Select-Object TimeCreated,@{N='Reason';E={$_.Properties[2].Value}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"uptime": self.get_uptime(), "restart_history": self.get_restart_history()}
