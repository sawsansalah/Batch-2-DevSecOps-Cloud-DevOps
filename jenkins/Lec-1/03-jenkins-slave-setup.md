
# Adding a Jenkins Slave on Ubuntu 

This guide provides step-by-step instructions to configure a Jenkins agent (slave) on an Ubuntu VM 

---

## ✅ Prerequisites

- Jenkins master is up and running.
- Ubuntu VM is created in Google Cloud Platform.
- You have SSH access to the VM.
- Java is installed on the VM.
- The VM is network-accessible by the Jenkins master.

---

## 🔧 Step 1: Install Java on Ubuntu (Slave)

SSH into your GCP Ubuntu VM and run:

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
java -version
```

---


## 🔑 Step 2: Set Up SSH Keys (for agent connection)

On Jenkins master, generate an SSH key if not already done:

```bash
ssh-keygen -t rsa -b 4096 -C "jenkins-agent"
```

Copy the public key to the GCP Ubuntu agent:

```bash
nano .ssh/authorized_keys
##add your public key
```

Test SSH login:

```bash
ssh your_user@<gcp-vm-ip>
```

---

## 🖥️ Step 4: Add the Agent Node in Jenkins Master

1. Go to **Jenkins Dashboard** → **Manage Jenkins** → **Manage Nodes and Clouds** → **New Node**
2. Enter:
   - **Node name**: `gcp-agent`
   - **Type**: Permanent Agent

3. Click **OK**, then fill in:
   - **# of executors**: e.g., 1 or 2
   - **Remote root directory**: `/home/jenkins/agent`
   - **Labels**: e.g., `gcp`
   - **Launch method**: *Launch agents via SSH*

4. Configure SSH:
   - **Host**: `<gcp-vm-ip>`
   - **Credentials**: Add Jenkins credentials for SSH:
     - Username: `jenkins`
     - Private Key: Paste the contents of `~/.ssh/id_rsa`

5. Click **Save**, then **Launch agent** to test the connection.

---

## 📂 Step 5: Add Node Usage in Jenkinsfile

In your `Jenkinsfile`, you can now target the slave using its **label**:

```groovy
pipeline {
    agent {
        label 'gcp'
    }
    tools {
        jdk 'JDK17'
        maven 'Maven3'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/project.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
```

---

## 🧪 Step 6: Run the Job

Trigger the pipeline. Jenkins will assign the job to the GCP-based slave if it matches the label.

---

## 📌 Tips

- Ensure firewall rules allow SSH access (port 22) from Jenkins master to the VM.

- Monitor agent logs under **Manage Nodes → gcp-agent → Log**.
