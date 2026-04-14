"""
Windows At scheduler — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class TaskSchedulerManager:
    """Windows Task Scheduler manager."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_tasks(self, folder="\\"):
        out = self._run_ps(f"Get-ScheduledTask -TaskPath '{folder}*' -ErrorAction SilentlyContinue | Select-Object TaskName,TaskPath,State,Author | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_task_details(self, name):
        out = self._run_ps(f"Get-ScheduledTask -TaskName '{name}' -ErrorAction SilentlyContinue | Get-ScheduledTaskInfo | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def check_failed(self):
        out = self._run_ps("Get-ScheduledTask | Where-Object {{ $_.State -eq 'Ready' }} | ForEach-Object {{ $info = $_ | Get-ScheduledTaskInfo; if($info.LastTaskResult -ne 0 -and $info.LastTaskResult -ne 267009){{ [PSCustomObject]@{{Name=$_.TaskName;LastResult=$info.LastTaskResult;LastRun=$info.LastRunTime}} }} }} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_running(self):
        out = self._run_ps("Get-ScheduledTask | Where-Object {{ $_.State -eq 'Running' }} | Select-Object TaskName,TaskPath | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"tasks": self.list_tasks(), "failed": self.check_failed(), "running": self.get_running()}
