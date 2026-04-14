"""
Windows Cgroup monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ProcessResourceMonitor:
    """Windows process resource monitor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def top_cpu(self, count=10):
        out = self._run_ps(f"Get-Process | Sort-Object CPU -Descending | Select-Object -First {count} Name,Id,@{{N='CPU_Sec';E={{[math]::Round($_.CPU,1)}}}},@{{N='MemMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def top_memory(self, count=10):
        out = self._run_ps(f"Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First {count} Name,Id,@{{N='MemMB';E={{[math]::Round($_.WorkingSet64/1MB,1)}}}},@{{N='PeakMB';E={{[math]::Round($_.PeakWorkingSet64/1MB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def top_io(self, count=10):
        out = self._run_ps(f"Get-Process | Sort-Object -Property @{{Expression={{$_.IO.ReadTransferCount + $_.IO.WriteTransferCount}};Descending=$true}} -ErrorAction SilentlyContinue | Select-Object -First {count} Name,Id | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_system_usage(self):
        out = self._run_ps("$os = Get-CimInstance Win32_OperatingSystem; [PSCustomObject]@{{TotalMemGB=[math]::Round($os.TotalVisibleMemorySize/1MB,1);FreeMemGB=[math]::Round($os.FreePhysicalMemory/1MB,1);CPU=(Get-CimInstance Win32_Processor).LoadPercentage;Processes=(Get-Process).Count}} | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def full_audit(self):
        return {"system": self.get_system_usage(), "top_cpu": self.top_cpu(), "top_memory": self.top_memory()}
