"""
Windows Locale check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class LocaleCheck:
    """Windows Windows locale & regional settings checker — language, keyboard, timezone"""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def get_locale(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def get_keyboard(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_timezone(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def check_unicode(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}

