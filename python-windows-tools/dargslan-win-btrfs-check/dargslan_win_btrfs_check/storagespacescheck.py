"""
Windows Btrfs check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class StorageSpacesCheck:
    """Windows Storage Spaces & ReFS checker."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_pools(self):
        out = self._run_ps("Get-StoragePool | Where-Object IsPrimordial -eq $false | Select-Object FriendlyName,OperationalStatus,HealthStatus,@{{N='SizeGB';E={{[math]::Round($_.Size/1GB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def list_disks(self):
        out = self._run_ps("Get-PhysicalDisk | Select-Object FriendlyName,MediaType,HealthStatus,OperationalStatus,@{{N='SizeGB';E={{[math]::Round($_.Size/1GB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_health(self):
        out = self._run_ps("Get-StorageSubSystem | Get-StorageHealthReport -ErrorAction SilentlyContinue | ConvertTo-Json -Depth 3")
        try: return json.loads(out) if out else {"status": "OK"}
        except: return {"status": "Cannot retrieve health report"}
    def get_volumes(self):
        out = self._run_ps("Get-Volume | Where-Object DriveLetter | Select-Object DriveLetter,FileSystemLabel,FileSystem,HealthStatus,@{{N='SizeGB';E={{[math]::Round($_.Size/1GB,1)}}}},@{{N='FreeGB';E={{[math]::Round($_.SizeRemaining/1GB,1)}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"pools": self.list_pools(), "disks": self.list_disks(), "volumes": self.get_volumes()}
