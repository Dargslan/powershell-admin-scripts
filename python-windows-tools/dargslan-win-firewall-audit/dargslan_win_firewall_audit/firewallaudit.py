"""
Windows Firewall audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class FirewallAudit:
    """Windows Firewall auditor — rules, profiles, logging, inbound/outbound."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_rules(self, direction="Inbound", count=30):
        out = self._run_ps(f"Get-NetFirewallRule -Direction {direction} -Enabled True | Select-Object -First {count} DisplayName,Action,Profile | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_profiles(self):
        out = self._run_ps("Get-NetFirewallProfile | Select-Object Name,Enabled,DefaultInboundAction,DefaultOutboundAction,LogAllowed,LogBlocked | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_logging(self):
        out = self._run_ps("Get-NetFirewallProfile | Select-Object Name,LogFileName,LogMaxSizeKilobytes,LogAllowed,LogBlocked | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def find_any_rules(self):
        out = self._run_ps("Get-NetFirewallRule -Enabled True | Where-Object { $_.Action -eq 'Allow' -and $_.Profile -match 'Any|Public' } | Select-Object -First 20 DisplayName,Direction,Profile | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"profiles": self.check_profiles(), "inbound_rules": self.list_rules("Inbound"), "any_profile_rules": self.find_any_rules(), "logging": self.check_logging()}
