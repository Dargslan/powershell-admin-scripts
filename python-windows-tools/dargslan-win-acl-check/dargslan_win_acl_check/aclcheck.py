"""
Windows Acl check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, os, json

class AclCheck:
    """Windows NTFS ACL & permissions auditor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def check_folder_acl(self, path=None):
        path = path or os.environ.get("SYSTEMROOT", "C:\\Windows")
        out = self._run_ps(f"Get-Acl '{path}' | Select-Object Owner,AccessToString | ConvertTo-Json")
        try: return json.loads(out)
        except: return {"path": path, "error": "Cannot read ACL"}
    def check_inheritance(self, path="C:\\Users"):
        out = self._run_ps(f"Get-ChildItem '{path}' -Directory | ForEach-Object {{ $acl = Get-Acl $_.FullName; [PSCustomObject]@{{Name=$_.Name;Inherited=$acl.AreAccessRulesProtected}} }} | ConvertTo-Json")
        try: return json.loads(out) if out.startswith("[") else [json.loads(out)] if out else []
        except: return []
    def find_open_permissions(self, path="C:\\Shares"):
        out = self._run_ps(f"Get-ChildItem '{path}' -Directory -ErrorAction SilentlyContinue | ForEach-Object {{ $acl = Get-Acl $_.FullName; $everyone = $acl.Access | Where-Object {{ $_.IdentityReference -match 'Everyone|Users' -and $_.FileSystemRights -match 'FullControl|Modify' }}; if($everyone){{ [PSCustomObject]@{{Path=$_.FullName;Identity=$everyone.IdentityReference.Value;Rights=$everyone.FileSystemRights.ToString()}} }} }} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def audit_shares(self):
        out = self._run_ps("Get-SmbShare | Where-Object {{ $_.Name -notmatch '\$' }} | Select-Object Name,Path,Description | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self, path=None):
        return {"acl": self.check_folder_acl(path), "shares": self.audit_shares(), "open_permissions": self.find_open_permissions()}
