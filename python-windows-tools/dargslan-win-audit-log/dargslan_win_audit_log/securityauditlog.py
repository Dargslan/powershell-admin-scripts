"""
Windows Audit log — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class SecurityAuditLog:
    """Windows Security Event Log analyzer."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=60)
            return r.stdout.strip()
        except Exception: return ""
    def get_logon_events(self, count=20):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Security';ID=4624}} -MaxEvents {count} -ErrorAction SilentlyContinue | Select-Object TimeCreated,@{{N='User';E={{$_.Properties[5].Value}}}},@{{N='LogonType';E={{$_.Properties[8].Value}}}},@{{N='Source';E={{$_.Properties[18].Value}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_failed_logons(self, count=20):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Security';ID=4625}} -MaxEvents {count} -ErrorAction SilentlyContinue | Select-Object TimeCreated,@{{N='User';E={{$_.Properties[5].Value}}}},@{{N='Source';E={{$_.Properties[19].Value}}}},@{{N='Reason';E={{$_.Properties[7].Value}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_policy_changes(self, count=20):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Security';ID=@(4719,4739,4704,4705)}} -MaxEvents {count} -ErrorAction SilentlyContinue | Select-Object TimeCreated,Id,Message | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_privilege_use(self, count=20):
        out = self._run_ps(f"Get-WinEvent -FilterHashtable @{{LogName='Security';ID=4672}} -MaxEvents {count} -ErrorAction SilentlyContinue | Select-Object TimeCreated,@{{N='User';E={{$_.Properties[1].Value}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"logons": self.get_logon_events(), "failed_logons": self.get_failed_logons(), "policy_changes": self.get_policy_changes()}
