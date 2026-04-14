"""
Windows Security scan — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class SecurityScan:
    """Windows security scanner — Defender, firewall, updates, UAC, configuration."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def check_defender(self):
        out = self._run_ps("Get-MpComputerStatus -ErrorAction SilentlyContinue | Select-Object AMServiceEnabled,AntispywareEnabled,AntivirusEnabled,RealTimeProtectionEnabled,IoavProtectionEnabled,BehaviorMonitorEnabled,AntivirusSignatureLastUpdated | ConvertTo-Json")
        try: return json.loads(out) if out else {"status": "Defender not available"}
        except: return {"status": "Cannot query Defender"}
    def check_firewall(self):
        out = self._run_ps("Get-NetFirewallProfile | Select-Object Name,Enabled | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_updates(self):
        out = self._run_ps("Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 5 HotFixID,InstalledOn | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_uac(self):
        out = self._run_ps("Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' | Select-Object EnableLUA,ConsentPromptBehaviorAdmin,PromptOnSecureDesktop | ConvertTo-Json")
        try: return json.loads(out) if out else {}
        except: return {}
    def full_scan(self):
        return {"defender": self.check_defender(), "firewall": self.check_firewall(), "recent_updates": self.check_updates(), "uac": self.check_uac()}
