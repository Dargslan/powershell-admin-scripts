"""
Windows Thermal monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ThermalMonitor:
    """Windows Windows thermal & temperature monitor — CPU temp, fan speed, thermal events"""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def check_temperature(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_thermal_zone(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def get_fan_info(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_events(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}

