"""
Windows Sysinfo — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, platform, os

class SystemInfo:
    """Windows system information tool — hardware, OS, CPU, memory, disk, network."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def get_os(self):
        out = self._run_ps("Get-CimInstance Win32_OperatingSystem | Select-Object Caption,Version,BuildNumber,OSArchitecture,LastBootUpTime,@{N='UptimeHours';E={[math]::Round(((Get-Date)-$_.LastBootUpTime).TotalHours,1)}} | ConvertTo-Json")
        try: return json.loads(out) if out else {"os": platform.platform(), "hostname": platform.node()}
        except: return {"os": platform.platform()}
    def get_cpu(self):
        out = self._run_ps("Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,LoadPercentage | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def get_memory(self):
        out = self._run_ps("$os = Get-CimInstance Win32_OperatingSystem; [PSCustomObject]@{TotalGB=[math]::Round($os.TotalVisibleMemorySize/1MB,1);FreeGB=[math]::Round($os.FreePhysicalMemory/1MB,1);UsedPercent=[math]::Round(($os.TotalVisibleMemorySize-$os.FreePhysicalMemory)/$os.TotalVisibleMemorySize*100,1)} | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def get_disk(self):
        out = self._run_ps("Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq 'Fixed' } | Select-Object DriveLetter,FileSystemLabel,@{N='SizeGB';E={[math]::Round($_.Size/1GB,1)}},@{N='FreeGB';E={[math]::Round($_.SizeRemaining/1GB,1)}},@{N='UsedPercent';E={[math]::Round(($_.Size-$_.SizeRemaining)/$_.Size*100,1)}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_network(self):
        out = self._run_ps("Get-NetAdapter -Physical | Where-Object Status -eq 'Up' | ForEach-Object { $ip = Get-NetIPAddress -InterfaceIndex $_.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue; [PSCustomObject]@{Name=$_.Name;Speed=$_.LinkSpeed;MAC=$_.MacAddress;IP=$ip.IPAddress} } | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_report(self):
        return {"os": self.get_os(), "cpu": self.get_cpu(), "memory": self.get_memory(), "disk": self.get_disk(), "network": self.get_network()}
