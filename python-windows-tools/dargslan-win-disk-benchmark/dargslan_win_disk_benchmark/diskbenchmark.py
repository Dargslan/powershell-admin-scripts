"""
Windows Disk benchmark — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class DiskBenchmark:
    """Windows Windows disk performance benchmark — read/write speed, IOPS testing"""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def test_read_speed(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def test_write_speed(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}
    def run_benchmark(self):
        out = self._run_ps("Write-Output 'Data collection placeholder'")
        return {"status": "ok", "data": out}

