"""
Windows Service monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ServiceMonitor:
    """Windows service monitor — service status, startup type, dependencies."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_services(self):
        out = self._run_ps("Get-Service | Select-Object Name,DisplayName,Status,StartType | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_failed(self):
        out = self._run_ps("Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic' } | Select-Object Name,DisplayName,Status | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_auto_start(self):
        out = self._run_ps("Get-Service | Where-Object { $_.StartType -eq 'Automatic' } | Select-Object Name,DisplayName,Status | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_dependencies(self, service="wuauserv"):
        out = self._run_ps(f"Get-Service -Name '{service}' -DependentServices -ErrorAction SilentlyContinue | Select-Object Name,Status | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"total": len(self.list_services()), "failed_auto": self.check_failed(), "auto_start_count": len(self.check_auto_start())}
