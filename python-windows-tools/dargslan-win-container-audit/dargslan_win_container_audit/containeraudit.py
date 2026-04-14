"""
Windows Container audit — https://dargslan.com
Free Cheat Sheets: https://dargslan.com/cheat-sheets
"""

import subprocess, json

class ContainerAudit:
    """Windows container & Docker Desktop auditor."""
    def _run(self, cmd):
        try:
            r = subprocess.run(cmd, capture_output=True, text=True, timeout=15, shell=True)
            return r.stdout.strip()
        except Exception: return ""
    def list_containers(self):
        out = self._run("docker ps --format \"{{json .}}\"")
        if not out: return [{"note": "Docker not running or not installed"}]
        containers = []
        for line in out.split("\n"):
            try: containers.append(json.loads(line))
            except: pass
        return containers
    def list_images(self):
        out = self._run("docker images --format \"{{json .}}\"")
        images = []
        for line in (out or "").split("\n"):
            try: images.append(json.loads(line))
            except: pass
        return images
    def check_security(self):
        containers = self._run("docker ps --format \"{{.ID}} {{.Names}}\"")
        issues = []
        for line in (containers or "").split("\n"):
            if not line.strip(): continue
            parts = line.split()
            cid = parts[0]
            inspect = self._run(f"docker inspect {cid} --format \"{{{{.HostConfig.Privileged}}}} {{{{.HostConfig.NetworkMode}}}} {{{{json .HostConfig.PortBindings}}}}\"")
            if "true" in str(inspect): issues.append({"container": parts[-1], "issue": "privileged mode"})
        return issues
    def check_docker_config(self):
        version = self._run("docker version --format \"{{json .}}\"")
        info = self._run("docker info --format \"{{json .}}\"")
        try: return {"version": json.loads(version), "info_summary": {"containers": json.loads(info).get("Containers",0)}}
        except: return {"version": version[:200], "info": info[:200]}
    def full_audit(self):
        return {"containers": self.list_containers(), "images": self.list_images(), "security": self.check_security()}
