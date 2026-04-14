"""
Windows Cron audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class TaskSchedulerAudit:
    """Windows Task Scheduler security audit."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_system_tasks(self):
        out = self._run_ps("Get-ScheduledTask | Where-Object {{ $_.Principal.UserId -match 'SYSTEM|Administrator' }} | Select-Object TaskName,TaskPath,State,@{{N='RunAs';E={{$_.Principal.UserId}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def find_privileged(self):
        out = self._run_ps("Get-ScheduledTask | Where-Object {{ $_.Principal.RunLevel -eq 'Highest' }} | Select-Object TaskName,TaskPath,@{{N='RunAs';E={{$_.Principal.UserId}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_triggers(self):
        out = self._run_ps("Get-ScheduledTask | ForEach-Object {{ $t = $_; $t.Triggers | ForEach-Object {{ [PSCustomObject]@{{Task=$t.TaskName;TriggerType=$_.CimClass.CimClassName;Enabled=$t.State}} }} }} | Select-Object -First 30 | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def find_disabled(self):
        out = self._run_ps("Get-ScheduledTask | Where-Object {{ $_.State -eq 'Disabled' }} | Select-Object TaskName,TaskPath | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"system_tasks": self.list_system_tasks(), "privileged": self.find_privileged(), "disabled_count": len(self.find_disabled())}
