"""
Windows Cgroup audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ResourceLimitsAudit:
    """Windows process resource limits auditor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def check_cpu_affinity(self):
        out = self._run_ps("Get-Process | Where-Object {{ $_.ProcessorAffinity }} | Select-Object -First 20 Name,Id,@{{N='Affinity';E={{$_.ProcessorAffinity.ToInt64($null)}}}},@{{N='WorkingSetMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_memory_limits(self):
        out = self._run_ps("Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 10 Name,Id,@{{N='WorkingSetMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}},@{{N='PeakMB';E={{[math]::Round($_.PeakWorkingSet64/1MB,1)}}}},@{{N='VirtualMB';E={{[math]::Round($_.VirtualMemorySize64/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def list_job_objects(self):
        out = self._run_ps("Get-CimInstance Win32_Process | Select-Object -First 20 Name,ProcessId,Priority,ThreadCount,@{{N='MemMB';E={{[math]::Round($_.WorkingSetSize/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"cpu_affinity": self.check_cpu_affinity(), "memory_top": self.check_memory_limits(), "processes": self.list_job_objects()}
