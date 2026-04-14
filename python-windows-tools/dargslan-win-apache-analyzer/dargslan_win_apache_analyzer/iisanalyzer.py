"""
Windows Apache analyzer — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class IisAnalyzer:
    """Windows IIS web server analyzer."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_sites(self):
        out = self._run_ps("Import-Module WebAdministration -ErrorAction SilentlyContinue; Get-Website | Select-Object Name,ID,State,PhysicalPath | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return [{"note": "IIS not installed or WebAdministration module missing"}]
    def list_app_pools(self):
        out = self._run_ps("Import-Module WebAdministration -ErrorAction SilentlyContinue; Get-ChildItem IIS:\\AppPools | Select-Object Name,State,ManagedRuntimeVersion | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_bindings(self):
        out = self._run_ps("Import-Module WebAdministration -ErrorAction SilentlyContinue; Get-WebBinding | Select-Object protocol,bindingInformation,sslFlags | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_ssl(self):
        out = self._run_ps("Get-ChildItem Cert:\\LocalMachine\\WebHosting -ErrorAction SilentlyContinue | Select-Object Subject,NotAfter,Thumbprint | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"sites": self.list_sites(), "app_pools": self.list_app_pools(), "bindings": self.check_bindings(), "ssl_certs": self.check_ssl()}
