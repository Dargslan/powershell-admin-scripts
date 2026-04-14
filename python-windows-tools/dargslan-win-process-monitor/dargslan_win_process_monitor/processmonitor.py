"""
Windows Process monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ProcessMonitor:
    """Windows process monitor — real-time process tracking."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_processes(self, top=20):
        out = self._run_ps(f"Get-Process | Sort-Object CPU -Descending | Select-Object -First {top} Name,Id,@{{N='CPU_Sec';E={{[math]::Round($_.CPU,1)}}}},@{{N='MemMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}},Handles | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def track_new(self):
        out = self._run_ps("Get-Process | Sort-Object StartTime -Descending -ErrorAction SilentlyContinue | Select-Object -First 10 Name,Id,StartTime,@{{N='MemMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_suspicious(self):
        out = self._run_ps("Get-Process | Where-Object {{ $_.Path -and $_.Path -notmatch 'Windows|Program Files|System32' }} | Select-Object -First 20 Name,Id,Path | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_tree(self):
        out = self._run_ps("Get-CimInstance Win32_Process | Select-Object -First 30 Name,ProcessId,ParentProcessId,@{{N='MemMB';E={{[math]::Round($_.WorkingSetSize/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"top_processes": self.list_processes(), "recent": self.track_new(), "suspicious": self.check_suspicious()}
