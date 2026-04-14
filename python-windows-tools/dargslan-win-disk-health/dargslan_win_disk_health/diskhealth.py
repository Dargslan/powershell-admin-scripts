"""
Windows Disk health — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class DiskHealth:
    """Windows disk health monitor — SMART status, errors, reliability."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def check_smart(self):
        out = self._run_ps("Get-PhysicalDisk | Select-Object FriendlyName,MediaType,HealthStatus,OperationalStatus,@{N='SizeGB';E={[math]::Round($_.Size/1GB,1)}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_errors(self):
        out = self._run_ps("Get-PhysicalDisk | Get-StorageReliabilityCounter -ErrorAction SilentlyContinue | Select-Object DeviceId,ReadErrorsTotal,WriteErrorsTotal,Temperature,Wear | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_reliability(self):
        out = self._run_ps("Get-WinEvent -FilterHashtable @{LogName='System';ID=7,11,51} -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated,Id,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"disks": self.check_smart(), "errors": self.check_errors(), "disk_events": self.get_reliability()}
