"""
Windows Bandwidth monitor — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, time

class BandwidthMonitor:
    """Windows network bandwidth monitor."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=30)
            return r.stdout.strip()
        except Exception: return ""
    def get_interface_stats(self):
        out = self._run_ps("Get-NetAdapterStatistics | Select-Object Name,ReceivedBytes,SentBytes,ReceivedUnicastPackets,SentUnicastPackets | ConvertTo-Json")
        try:
            data = json.loads(out) if out else []
            if isinstance(data, dict): data = [data]
            for d in data:
                d["ReceivedGB"] = round(d.get("ReceivedBytes",0)/1073741824, 2)
                d["SentGB"] = round(d.get("SentBytes",0)/1073741824, 2)
            return data
        except: return []
    def get_top_connections(self, count=20):
        out = self._run_ps(f"Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue | Select-Object -First {count} LocalAddress,LocalPort,RemoteAddress,RemotePort,OwningProcess,@{{N='Process';E={{(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name}}}} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def measure_throughput(self, seconds=3):
        s1 = self._run_ps("Get-NetAdapterStatistics | Select-Object Name,ReceivedBytes,SentBytes | ConvertTo-Json")
        time.sleep(seconds)
        s2 = self._run_ps("Get-NetAdapterStatistics | Select-Object Name,ReceivedBytes,SentBytes | ConvertTo-Json")
        try:
            d1 = json.loads(s1); d2 = json.loads(s2)
            if isinstance(d1, dict): d1,d2 = [d1],[d2]
            result = []
            for a,b in zip(d1,d2):
                rx = (b["ReceivedBytes"]-a["ReceivedBytes"])/seconds
                tx = (b["SentBytes"]-a["SentBytes"])/seconds
                result.append({"name": a["Name"], "rx_mbps": round(rx*8/1000000,2), "tx_mbps": round(tx*8/1000000,2)})
            return result
        except: return []
    def full_audit(self):
        return {"interfaces": self.get_interface_stats(), "connections": self.get_top_connections(), "throughput": self.measure_throughput()}
