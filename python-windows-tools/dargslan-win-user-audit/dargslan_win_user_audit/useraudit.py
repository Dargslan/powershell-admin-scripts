"""
Windows User audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class UserAudit:
    """Windows user account auditor — local users, admin check, password policy."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def list_users(self):
        out = self._run_ps("Get-LocalUser | Select-Object Name,Enabled,LastLogon,PasswordLastSet,PasswordExpires | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_admins(self):
        out = self._run_ps("Get-LocalGroupMember -Group 'Administrators' -ErrorAction SilentlyContinue | Select-Object Name,ObjectClass,PrincipalSource | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_passwords(self):
        out = self._run_ps("Get-LocalUser | Where-Object { $_.PasswordRequired -eq $false } | Select-Object Name,Enabled | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def find_disabled(self):
        out = self._run_ps("Get-LocalUser | Where-Object { $_.Enabled -eq $false } | Select-Object Name,LastLogon | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"users": self.list_users(), "admins": self.check_admins(), "no_password": self.check_passwords(), "disabled": self.find_disabled()}
