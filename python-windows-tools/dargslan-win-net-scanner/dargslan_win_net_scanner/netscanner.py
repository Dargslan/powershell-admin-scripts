"""
Windows Net scanner — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, socket, concurrent.futures

class NetScanner:
    """Windows network scanner — ping sweep, port scan, service detection."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=60)
            return r.stdout.strip()
        except Exception: return ""
    def ping_sweep(self, subnet="192.168.1", start=1, end=254):
        out = self._run_ps(f"{start}..{end} | ForEach-Object {{ $ip = '{subnet}.$_'; if (Test-Connection -ComputerName $ip -Count 1 -Quiet -TimeoutSeconds 1) {{ [PSCustomObject]@{{IP=$ip;Status='Up'}} }} }} | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def port_scan(self, host="localhost", ports=None):
        if ports is None: ports = [21,22,23,25,53,80,110,135,139,143,443,445,993,995,1433,3306,3389,5432,5900,8080]
        results = []
        with concurrent.futures.ThreadPoolExecutor(max_workers=20) as ex:
            def check(p):
                try:
                    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    s.settimeout(1)
                    r = s.connect_ex((host, p))
                    s.close()
                    return {"port": p, "open": r == 0}
                except: return {"port": p, "open": False}
            results = list(ex.map(check, ports))
        return [r for r in results if r["open"]]
    def detect_services(self, host="localhost"):
        open_ports = self.port_scan(host)
        services = {21:"FTP",22:"SSH",23:"Telnet",25:"SMTP",53:"DNS",80:"HTTP",110:"POP3",135:"RPC",139:"NetBIOS",143:"IMAP",443:"HTTPS",445:"SMB",993:"IMAPS",995:"POP3S",1433:"MSSQL",3306:"MySQL",3389:"RDP",5432:"PostgreSQL",5900:"VNC",8080:"HTTP-Alt"}
        for p in open_ports:
            p["service"] = services.get(p["port"], "Unknown")
        return open_ports
    def scan_subnet(self, subnet="192.168.1"):
        return {"hosts": self.ping_sweep(subnet), "note": "Sweep complete"}
    def full_audit(self):
        return {"local_ports": self.port_scan(), "services": self.detect_services()}
