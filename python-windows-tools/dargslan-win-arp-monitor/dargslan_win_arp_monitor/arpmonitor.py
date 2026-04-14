"""
Windows Arp monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, re

class ArpMonitor:
    """Windows ARP table monitor."""
    def _run(self, cmd):
        try:
            r = subprocess.run(cmd, capture_output=True, text=True, timeout=15, shell=True)
            return r.stdout.strip()
        except Exception: return ""
    def get_arp_table(self):
        out = self._run("arp -a")
        entries = []
        for line in out.split("\n"):
            m = re.match(r"\s+(\d+\.\d+\.\d+\.\d+)\s+([\w-]+)\s+(\w+)", line)
            if m: entries.append({"ip": m.group(1), "mac": m.group(2), "type": m.group(3)})
        return entries
    def detect_duplicates(self):
        table = self.get_arp_table()
        macs = {}
        for e in table:
            macs.setdefault(e["mac"], []).append(e["ip"])
        return {mac: ips for mac, ips in macs.items() if len(ips) > 1}
    def monitor_changes(self):
        out = self._run("powershell -NoProfile -Command \"Get-NetNeighbor | Select-Object IPAddress,LinkLayerAddress,State,InterfaceAlias | ConvertTo-Json\"")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"arp_table": self.get_arp_table(), "duplicates": self.detect_duplicates(), "neighbors": self.monitor_changes()}
