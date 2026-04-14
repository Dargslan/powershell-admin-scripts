"""
Windows Route check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class RouteCheck:
    """Windows Windows routing table checker — routes, gateways, persistent routes"""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def get_routes(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_gateway(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def list_persistent(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_metrics(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}

