"""
Windows Bonding check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class NicTeamingCheck:
    """Windows NIC Teaming checker."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_teams(self):
        out = self._run_ps("Get-NetLbfoTeam -ErrorAction SilentlyContinue | Select-Object Name,Status,TeamingMode,LoadBalancingAlgorithm | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return [{"note": "NIC Teaming not configured or not available"}]
    def get_team_members(self):
        out = self._run_ps("Get-NetLbfoTeamMember -ErrorAction SilentlyContinue | Select-Object Name,Team,AdministrativeMode,OperationalStatus | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_status(self):
        out = self._run_ps("Get-NetAdapter | Where-Object {{ $_.InterfaceDescription -match 'Multiplexor' }} | Select-Object Name,Status,LinkSpeed | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"teams": self.list_teams(), "members": self.get_team_members(), "status": self.check_status()}
