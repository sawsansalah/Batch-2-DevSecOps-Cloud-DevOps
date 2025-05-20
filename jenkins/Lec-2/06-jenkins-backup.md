# 🛡️ Jenkins Backup Guide (Ubuntu VM Setup)

This guide explains how to back up Jenkins running as a system service on an Ubuntu VM, and push the backup to a **GitHub repository**.

---

## ✅ Step 1: Locate `JENKINS_HOME`

Default location:
```bash
ls /var/lib/jenkins
```
You should see: `jobs/`, `plugins/`, `config.xml`, etc.

---

## ✅ Step 2: Stop Jenkins Temporarily

```bash
sudo systemctl stop jenkins
```

---

## ✅ Step 3: Backup Jenkins Directory

Create compressed archive:
```bash
sudo tar -czvf /opt/jenkins-backup-$(date +%F).tar.gz /var/lib/jenkins
```

---

## ✅ Step 4: Start Jenkins Again

```bash
sudo systemctl start jenkins
```

---

## ✅ Step 5: Push Backup to GitHub

### 🔹 Prerequisites:
- Create a private GitHub repo (e.g., `jenkins-backups`)
- Clone it on your VM (e.g., to `/opt/jenkins-git-backups`)
- Set up SSH access or use a PAT

### 🔹 Push Example:

```bash
# Move backup into repo
mv /opt/jenkins-backup-$(date +%F).tar.gz /opt/jenkins-git-backups/

cd /opt/jenkins-git-backups
git add .
git commit -m "Backup on $(date +%F)"
git push origin main
```

---

## ♻️ Step 6: Automate with Cron

### 🔹 Backup Script `/usr/local/bin/jenkins-backup.sh`

```bash
#!/bin/bash

JENKINS_HOME="/var/lib/jenkins"
BACKUP_FILE="/opt/jenkins-git-backups/jenkins-backup-$(date +%F).tar.gz"
GIT_DIR="/opt/jenkins-git-backups"

# Stop Jenkins
sudo systemctl stop jenkins

# Create backup
tar -czf "$BACKUP_FILE" -C "$JENKINS_HOME" .

# Start Jenkins again
sudo systemctl start jenkins

# Git push
cd "$GIT_DIR"
git add .
git commit -m "Backup on $(date +%F)"
git push origin main

# Keep only last 7 backups
find "$GIT_DIR" -name "*.tar.gz" -mtime +7 -exec rm {} \;
```

Make it executable:
```bash
sudo chmod +x /usr/local/bin/jenkins-backup.sh
```

Schedule via cron (runs daily at 2 AM):
```bash
sudo crontab -e
```

Add line:
```
0 2 * * * /usr/local/bin/jenkins-backup.sh
```

---

## ✅ Restore

```bash
sudo systemctl stop jenkins
sudo tar -xzvf jenkins-backup-YYYY-MM-DD.tar.gz -C /var/lib/jenkins
sudo systemctl start jenkins
```

---

## 📝 Notes

- Add `.gitignore` if storing logs, temporary files, etc.
- Use GPG or Vault for extra security if pushing encrypted backups.
