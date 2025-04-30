# 🧪 Jenkins + Remote Backup to S3

> A practice that sets up a multi-container Docker environment to perform automated MySQL database backups via Jenkins and upload them to AWS S3.

---

## 🎯 Objective

Automate the process of backing up a MySQL database using a Bash script, triggered by a Jenkins job, and store the backup in an AWS S3 bucket.

---

## 🧰 Technologies Used

- Docker
- Docker Compose
- Jenkins
- MySQL
- AWS CLI
- Bash

---

## 📂 Files & Structure

```bash
.
├── docker-compose.yml
├── Dockerfile
├── backup_process.sh
└── jenkins_volume/ (persistent Jenkins data)
```

---

## 📝 Steps Performed

1. **Defined Docker Compose with 3 services**:
   - `jenkins_ssh`: Jenkins server accessible at `localhost:8081`.
   - `remote_host`: Custom container that includes the backup script.
   - `db_host`: MySQL database initialized with a root password and persistent volume.

2. **Created a custom Dockerfile for `remote_host`**:
   - Installs required packages.
   - Adds the backup script at `/tmp/backup_process.sh`.

3. **Developed a `script.sh` to perform the following**:
   - Dumps a MySQL database using `mysqldump`.
   - Exports AWS credentials.
   - Uploads the backup to a specified S3 bucket.

4. **Created a Jenkins freestyle project**:
   - Executes the following command via SSH:
     ```bash
     bash /tmp/backup_process.sh $MYSQL_HOST $MYSQL_PASSWORD $DATABASE_NAME $AWS_ACCESS_KEY $AWS_BUCKET_NAME
     ```

---

## 💡 Useful Commands

```bash
docker compose up -d
```

Access Jenkins: [http://localhost:8081](http://localhost:8081)

---

## ✅ Expected Result

After executing the Jenkins job, a `.sql` backup of the MySQL database should be created and uploaded to the designated S3 bucket.

