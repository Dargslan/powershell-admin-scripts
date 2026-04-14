"""
Windows Apt history — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, winreg

class SoftwareHistory:
    """Windows software installation history tracker."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_installed(self):
        out = self._run_ps("Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {{ $_.DisplayName }} | Select-Object DisplayName,DisplayVersion,Publisher,InstallDate | Sort-Object DisplayName | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def recent_installs(self, days=30):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Application';ID=11707}} -MaxEvents 50 -ErrorAction SilentlyContinue | Where-Object {{ $_.TimeCreated -gt (Get-Date).AddDays(-{days}) }} | Select-Object TimeCreated,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def recent_uninstalls(self, days=30):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Application';ID=11724}} -MaxEvents 50 -ErrorAction SilentlyContinue | Where-Object {{ $_.TimeCreated -gt (Get-Date).AddDays(-{days}) }} | Select-Object TimeCreated,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_msi_logs(self):
        out = self._run_ps("Get-ChildItem $env:TEMP -Filter 'MSI*.log' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 10 Name,Length,LastWriteTime | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"installed": self.list_installed(), "recent_installs": self.recent_installs(), "recent_uninstalls": self.recent_uninstalls()}
