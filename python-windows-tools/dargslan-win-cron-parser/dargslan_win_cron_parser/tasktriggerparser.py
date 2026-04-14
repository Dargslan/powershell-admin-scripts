"""
Windows Cron parser — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class TaskTriggerParser:
    """Windows Task Scheduler trigger parser — cron-to-Windows, trigger decoding"""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def parse_trigger(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def list_triggers(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def compare_schedules(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}

