"""
Windows Ssl checker — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json, ssl, socket
from datetime import datetime

class SslChecker:
    """Windows SSL/TLS certificate checker — expiry, chain, protocols."""
    def check_cert(self, host="dargslan.com", port=443):
        try:
            ctx = ssl.create_default_context()
            with ctx.wrap_socket(socket.socket(), server_hostname=host) as s:
                s.settimeout(5)
                s.connect((host, port))
                cert = s.getpeercert()
                not_after = datetime.strptime(cert["notAfter"], "%b %d %H:%M:%S %Y %Z")
                days_left = (not_after - datetime.utcnow()).days
                return {"host": host, "subject": dict(x[0] for x in cert["subject"]), "issuer": dict(x[0] for x in cert["issuer"]), "not_after": str(not_after), "days_left": days_left, "serial": cert.get("serialNumber",""), "version": cert.get("version","")}
        except Exception as e:
            return {"host": host, "error": str(e)}
    def check_chain(self, host="dargslan.com"):
        cert = self.check_cert(host)
        return {"host": host, "issuer": cert.get("issuer",{}), "valid": "error" not in cert}
    def check_protocols(self, host="dargslan.com"):
        results = {}
        for proto_name, proto in [("TLSv1.2", ssl.PROTOCOL_TLSv1_2)]:
            try:
                ctx = ssl.SSLContext(proto)
                with ctx.wrap_socket(socket.socket(), server_hostname=host) as s:
                    s.settimeout(3)
                    s.connect((host, 443))
                    results[proto_name] = True
            except: results[proto_name] = False
        return results
    def check_ciphers(self, host="dargslan.com"):
        try:
            ctx = ssl.create_default_context()
            with ctx.wrap_socket(socket.socket(), server_hostname=host) as s:
                s.settimeout(5)
                s.connect((host, 443))
                return {"cipher": s.cipher(), "version": s.version()}
        except Exception as e: return {"error": str(e)}
    def full_audit(self):
        return {"cert": self.check_cert(), "chain": self.check_chain(), "protocols": self.check_protocols(), "cipher": self.check_ciphers()}
