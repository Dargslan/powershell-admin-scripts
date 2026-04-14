"""
Windows Dns check — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, socket

class DnsCheck:
    """Windows DNS configuration checker."""
    def _run_ps(self, cmd):
        try:
            r = subprocess.run(["powershell", "-NoProfile", "-Command", cmd], capture_output=True, text=True, timeout=15)
            return r.stdout.strip()
        except Exception: return ""
    def check_config(self):
        out = self._run_ps("Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses } | Select-Object InterfaceAlias,ServerAddresses | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def test_resolution(self, domain="dargslan.com"):
        try:
            ips = socket.getaddrinfo(domain, None)
            return {"domain": domain, "resolved": list(set(ip[4][0] for ip in ips))}
        except: return {"domain": domain, "error": "Cannot resolve"}
    def check_cache(self):
        out = self._run_ps("Get-DnsClientCache | Select-Object -First 20 Entry,Name,Type,Data | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def get_nrpt(self):
        out = self._run_ps("Get-DnsClientNrptRule -ErrorAction SilentlyContinue | Select-Object Namespace,NameServers | ConvertTo-Json")
        try: return json.loads(out) if out else []
        except: return []
    def full_audit(self):
        return {"config": self.check_config(), "resolution_test": self.test_resolution(), "cache_entries": len(self.check_cache())}
