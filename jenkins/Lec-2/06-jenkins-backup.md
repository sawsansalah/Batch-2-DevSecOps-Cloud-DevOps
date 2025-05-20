# 🛡️ Jenkins Jobs-Only Backup Guide (Ubuntu VM Setup)

This guide explains how to back up **only Jenkins jobs** on an Ubuntu VM and push the backup to a **private GitHub repository**.

---

## ✅ Step 1: Locate `JENKINS_HOME`

Default location:
```bash
ls /var/lib/jenkins/jobs
You should see your individual job directories inside.

✅ Step 2: Stop Jenkins Temporarily (optional but recommended)
```bash

sudo systemctl stop jenkins
✅ Step 3: Backup Jenkins Jobs Directory
Create compressed archive:

```bash

sudo tar -czvf /opt/jenkins-jobs-backup-$(date +%F).tar.gz -C /var/lib/jenkins jobs
✅ Step 4: Start Jenkins Again (if you stopped it)
```bash

sudo systemctl start jenkins
✅ Step 5: Push Jobs Backup to GitHub
🔹 Prerequisites:
Create a private GitHub repo (e.g., jenkins-jobs-backups)

Clone it to /opt/jenkins-jobs-git

Set up SSH access or use a PAT

🔹 Push Example:
bash
Copy
Edit
# Move backup into repo
mv /opt/jenkins-jobs-backup-$(date +%F).tar.gz /opt/jenkins-jobs-git/

cd /opt/jenkins-jobs-git
git add .
git commit -m "Jobs backup on $(date +%F)"
git push origin main
♻️ Step 6: Automate with Cron
🔹 Script: /usr/local/bin/jenkins-jobs-backup.sh
bash
Copy
Edit
#!/bin/bash

JENKINS_HOME="/var/lib/jenkins"
BACKUP_FILE="/opt/jenkins-jobs-git/jenkins-jobs-backup-$(date +%F).tar.gz"
GIT_DIR="/opt/jenkins-jobs-git"

# Stop Jenkins (optional)
sudo systemctl stop jenkins

# Backup only jobs/
tar -czf "$BACKUP_FILE" -C "$JENKINS_HOME" jobs

# Start Jenkins again
sudo systemctl start jenkins

# Git push
cd "$GIT_DIR"
git add .
git commit -m "Jobs backup on $(date +%F)"
git push origin main

# Keep only last 7 backups
find "$GIT_DIR" -name "*.tar.gz" -mtime +7 -exec rm {} \;
Make it executable:

bash
Copy
Edit
sudo chmod +x /usr/local/bin/jenkins-jobs-backup.sh
Schedule via cron (daily at 2 AM):

bash
Copy
Edit
sudo crontab -e
Add:

ruby
Copy
Edit
0 2 * * * /usr/local/bin/jenkins-jobs-backup.sh
✅ Restore
bash
Copy
Edit
sudo systemctl stop jenkins
sudo tar -xzvf jenkins-jobs-backup-YYYY-MM-DD.tar.gz -C /var/lib/jenkins
sudo systemctl start jenkins
📝 Notes
Only the jobs/ folder is backed up.

Keep GitHub repo private.

Add .gitignore for logs or unnecessary files.

yaml
Copy
Edit
