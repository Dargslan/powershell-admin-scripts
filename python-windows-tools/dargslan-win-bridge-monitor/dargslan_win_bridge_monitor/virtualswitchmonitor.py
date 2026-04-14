"""
Windows Bridge monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class VirtualSwitchMonitor:
    """Windows Hyper-V virtual switch monitor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def list_vswitches(self):
        out = self._run_ps("Get-VMSwitch -ErrorAction SilentlyContinue | Select-Object Name,SwitchType,NetAdapterInterfaceDescription,AllowManagementOS | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return [{"note": "Hyper-V not installed"}]
    def get_vswitch_ports(self):
        out = self._run_ps("Get-VMNetworkAdapter -All -ErrorAction SilentlyContinue | Select-Object VMName,SwitchName,MacAddress,Status,IPAddresses | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def check_vlans(self):
        out = self._run_ps("Get-VMNetworkAdapterVlan -ErrorAction SilentlyContinue | Select-Object VMName,AccessVlanId,NativeVlanId,OperationMode | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"vswitches": self.list_vswitches(), "ports": self.get_vswitch_ports(), "vlans": self.check_vlans()}
