# Jenkins Pipeline Integration with Private GitHub Repository (Using PAT)

This guide walks you through how to integrate a Jenkins pipeline with a **private GitHub repository** using a **Personal Access Token (PAT)**.

---

## 🔹 Step 1: Generate GitHub Personal Access Token (PAT)

1. Go to **GitHub → Settings → Developer Settings → Personal access tokens**.
2. Click **"Generate new token"**.
3. Choose the following scope:
   - ✅ `repo` → Full control of private repositories
4. Click **Generate token**, then **copy and save** it securely (you won't see it again).

---

## 🔹 Step 2: Add GitHub PAT as a Secret in Jenkins

1. Go to **Jenkins Dashboard → Manage Jenkins → Credentials**.
2. Choose (or create) a domain such as `global`.
3. Click **"Add Credentials"**.
4. Fill in the following:
   - **Kind**: `Username with password`
   - **Username**: Your GitHub username
   - **Password**: The **PAT** you created in Step 1
   - **ID**: `github-creds` (or any ID you prefer)

---

## 🔹 Step 3: Create Jenkins Pipeline

Create a Jenkins pipeline with the following `Jenkinsfile` (declarative pipeline format):

```groovy
pipeline {
    agent any

    environment {
        GIT_CREDENTIALS = 'github-creds'  // Use the ID from Step 2
    }

    stages {
        stage('Clone Private Repo') {
            steps {
                git credentialsId: "${GIT_CREDENTIALS}", url: 'https://github.com/your-username/private-repo.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage goes here'
            }
        }
    }
}
