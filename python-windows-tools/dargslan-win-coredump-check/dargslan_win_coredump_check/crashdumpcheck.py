"""
Windows Coredump check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, os, glob

class CrashDumpCheck:
    """Windows crash dump analyzer."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_minidumps(self):
        dump_dir = os.path.join(os.environ.get("SYSTEMROOT","C:\\Windows"), "Minidump")
        if not os.path.exists(dump_dir): return []
        dumps = []
        for f in sorted(glob.glob(os.path.join(dump_dir,"*.dmp")), key=os.path.getmtime, reverse=True)[:20]:
            dumps.append({"file": os.path.basename(f), "size_kb": round(os.path.getsize(f)/1024,1), "date": str(os.path.getmtime(f))})
        return dumps
    def check_wer_reports(self):
        out = self._run_ps("Get-ChildItem '$env:LOCALAPPDATA\\Microsoft\\Windows\\WER\\ReportArchive' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 10 Name,LastWriteTime | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_bsod_events(self):
        out = self._run_ps("Get-WinEvent -FilterHashtable @{{LogName='System';ID=1001;ProviderName='Microsoft-Windows-WER-SystemErrorReporting'}} -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"minidumps": self.list_minidumps(), "wer_reports": self.check_wer_reports(), "bsod_events": self.check_bsod_events()}
