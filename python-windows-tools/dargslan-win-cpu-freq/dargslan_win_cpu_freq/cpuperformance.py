"""
Windows Cpu freq — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class CpuPerformance:
    """Windows CPU performance monitor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def get_cpu_info(self):
        out = self._run_ps("Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,CurrentClockSpeed,LoadPercentage,L2CacheSize,L3CacheSize | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def get_power_plan(self):
        out = self._run_ps("powercfg /getactivescheme")
        plans = self._run_ps("powercfg /list")
        return {"active": out, "all_plans": plans}
    def check_throttling(self):
        out = self._run_ps("Get-WinEvent -FilterHashtable @{{LogName='System';ID=37}} -MaxEvents 5 -ErrorAction SilentlyContinue | Select-Object TimeCreated,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"cpu": self.get_cpu_info(), "power_plan": self.get_power_plan(), "throttling": self.check_throttling()}
