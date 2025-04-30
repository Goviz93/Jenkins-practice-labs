# 🚀 Jenkins Practice Labs

> Hands-on repository to document and test multiple Jenkins-based automation practices using Docker and real-world scenarios.

---

## 📦 Structure

This repository includes individual folders for each practice, each with its own Docker setup and documentation.

```bash
jenkins-practices/
├── Remote_SSH/
│   └── README.md
├── ...
└── README.md
```

---

## ✅ Available Practices

| ID | Title | Description |
|----|-------|-------------|
| 01 | [Remote Command Execution via SSH from Jenkins](./Remote_SSH/README.md) | Execute commands on a remote container (`remote_host`) from Jenkins (`jenkins_ssh`) using SSH within a Docker Compose network. |
| 02 | [Jenkins Remote Backup to S3](./MySQL_AWS_Backup/README.md) | Automates a MySQL backup using Jenkins and uploads it to AWS S3. |

> ⚠️ More practices will be added soon...

---

## 🛠️ Requirements

- Docker & Docker Compose
- Basic knowledge of Jenkins
- AWS credentials (for S3 backup practice)

---

## 📌 Notes

This repository is for educational purposes and DevOps training. All credentials in examples are dummy and should be replaced with secure secrets.
