# 🧪 Remote Command Execution via SSH from Jenkins

> A practice that demonstrates how to establish an SSH connection from a Jenkins container to a remote host container and execute commands.

---

## 🎯 Objective

Execute commands on a remote container (`remote_host`) from Jenkins (`jenkins_ssh`) using SSH within a Docker Compose network.

---

## 🧰 Technologies Used

- Docker
- Docker Compose
- Jenkins
- OpenSSH

---

## 📂 Files & Structure

```bash
.
├── docker-compose.yml
├── Dockerfile
└── jenkins_volume/ (persistent Jenkins data)
```

---

## 📝 Steps Performed

1. **Docker Compose Setup**:
   - `jenkins_ssh`: Jenkins instance running on port `8081`.
   - `remote_host`: Custom container built with SSH server enabled.

2. **SSH Key Exchange**:
   - Generated SSH key pair.
   - Public key added to `remote_host` under `/home/remote_user/.ssh/authorized_keys`.

3. **Jenkins Configuration**:
   - Created a freestyle project.
   - Executed SSH command to `remote_host` such as:
     ```bash
     ssh -o StrictHostKeyChecking=no remote_user@remote-host "uptime"
     ```

---

## 💡 Useful Commands

```bash
docker compose up -d
```

Access Jenkins: [http://localhost:8081](http://localhost:8081)

---

## ✅ Expected Result

Jenkins successfully connects to the `remote_host` container via SSH and executes remote shell commands as part of a CI job.
