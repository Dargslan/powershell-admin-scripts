"""
Windows Port monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class PortMonitor:
    """Windows listening port monitor — TCP/UDP ports, associated processes."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_listening(self):
        out = self._run_ps("Get-NetTCPConnection -State Listen | Select-Object LocalAddress,LocalPort,OwningProcess,@{N='Process';E={(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name}} | Sort-Object LocalPort | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_well_known(self):
        out = self._run_ps("Get-NetTCPConnection -State Listen | Where-Object { $_.LocalPort -lt 1024 } | Select-Object LocalPort,@{N='Process';E={(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def find_suspicious(self):
        out = self._run_ps("Get-NetTCPConnection -State Listen | Where-Object { $_.LocalPort -gt 49151 } | Select-Object LocalAddress,LocalPort,@{N='Process';E={(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_connections(self, state="Established"):
        out = self._run_ps(f"Get-NetTCPConnection -State {state} | Select-Object -First 30 LocalAddress,LocalPort,RemoteAddress,RemotePort,@{{N='Process';E={{(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"listening": self.list_listening(), "well_known": self.check_well_known(), "suspicious_high_ports": self.find_suspicious()}
