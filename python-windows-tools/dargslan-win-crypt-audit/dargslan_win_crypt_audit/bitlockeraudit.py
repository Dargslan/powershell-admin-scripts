"""
Windows Crypt audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class BitLockerAudit:
    """Windows BitLocker & encryption auditor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def check_bitlocker(self):
        out = self._run_ps("Get-BitLockerVolume -ErrorAction SilentlyContinue | Select-Object MountPoint,VolumeStatus,ProtectionStatus,EncryptionMethod,EncryptionPercentage | ConvertTo-Json")
        try: return json.loads(out) if out else [{"status": "BitLocker not available or not configured"}]
        except: return []
    def check_tpm(self):
        out = self._run_ps("Get-Tpm -ErrorAction SilentlyContinue | Select-Object TpmPresent,TpmReady,TpmEnabled,ManufacturerVersion | ConvertTo-Json")
        try: return json.loads(out) if out else {"status": "TPM not available"}
        except: return {}
    def get_recovery_keys(self):
        out = self._run_ps("(Get-BitLockerVolume -ErrorAction SilentlyContinue).KeyProtector | Where-Object { $_.KeyProtectorType -eq 'RecoveryPassword' } | Select-Object KeyProtectorId,KeyProtectorType | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"bitlocker": self.check_bitlocker(), "tpm": self.check_tpm(), "recovery_keys": self.get_recovery_keys()}
