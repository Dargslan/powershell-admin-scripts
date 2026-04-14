"""
Windows Disk cleaner — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, os, glob, shutil

class DiskCleaner:
    """Windows disk cleanup tool — temp files, recycle bin, update cache."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def clean_temp(self):
        temp = os.environ.get("TEMP", "C:\\Windows\\Temp")
        count = 0; freed = 0
        for f in glob.glob(os.path.join(temp, "*")):
            try:
                size = os.path.getsize(f) if os.path.isfile(f) else 0
                if os.path.isfile(f): os.unlink(f); count += 1; freed += size
                elif os.path.isdir(f): shutil.rmtree(f, ignore_errors=True); count += 1
            except: pass
        return {"cleaned": count, "freed_mb": round(freed/1048576, 1)}
    def clean_recycle_bin(self):
        out = self._run_ps("Clear-RecycleBin -Force -ErrorAction SilentlyContinue; Write-Output 'done'")
        return {"status": "cleared" if "done" in out else "failed"}
    def clean_update_cache(self):
        out = self._run_ps("$before = (Get-ChildItem '$env:WINDIR\SoftwareDistribution\Download' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum; Remove-Item '$env:WINDIR\SoftwareDistribution\Download\*' -Recurse -Force -ErrorAction SilentlyContinue; [math]::Round($before/1MB,1)")
        return {"freed_mb": float(out) if out else 0}
    def analyze(self):
        temp_size = self._run_ps("[math]::Round((Get-ChildItem $env:TEMP -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum/1MB,1)")
        win_temp = self._run_ps("[math]::Round((Get-ChildItem '$env:WINDIR\Temp' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum/1MB,1)")
        return {"user_temp_mb": float(temp_size) if temp_size else 0, "windows_temp_mb": float(win_temp) if win_temp else 0}
    def full_audit(self):
        return {"analysis": self.analyze()}
