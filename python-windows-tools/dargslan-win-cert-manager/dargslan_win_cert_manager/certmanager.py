"""
Windows Cert manager — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json
from datetime import datetime, timedelta

class CertManager:
    """Windows Certificate Store manager."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_personal(self):
        out = self._run_ps("Get-ChildItem Cert:\\LocalMachine\\My | Select-Object Subject,Thumbprint,NotBefore,NotAfter,Issuer | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def list_root_ca(self):
        out = self._run_ps("Get-ChildItem Cert:\\LocalMachine\\Root | Select-Object Subject,Thumbprint,NotAfter | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_expiring(self, days=30):
        out = self._run_ps(f"Get-ChildItem Cert:\\LocalMachine\\My | Where-Object {{ $_.NotAfter -lt (Get-Date).AddDays({days}) }} | Select-Object Subject,Thumbprint,NotAfter | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_web_hosting(self):
        out = self._run_ps("Get-ChildItem Cert:\\LocalMachine\\WebHosting -ErrorAction SilentlyContinue | Select-Object Subject,Thumbprint,NotAfter | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"personal": self.list_personal(), "root_ca_count": len(self.list_root_ca()), "expiring_30d": self.check_expiring(30), "web_hosting": self.check_web_hosting()}
