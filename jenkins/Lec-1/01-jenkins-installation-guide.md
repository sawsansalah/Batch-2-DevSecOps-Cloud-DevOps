# Jenkins Installation Guide 

## Prerequisites

Before installing Jenkins, ensure that Java is installed on your system. Jenkins requires Java to run.

Install OpenJDK 17 using the following command:

```bash
sudo apt install openjdk-17-jre-headless -y
```

---

## Installing Jenkins

Follow these steps to install Jenkins manually.

### Step 1: Add Jenkins Key and Repository

1. Download the Jenkins GPG key:

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```

2. Add the Jenkins APT repository:

```bash
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
```

### Step 2: Install Jenkins

1. Update your system's package index:

```bash
sudo apt-get update
```

2. Install Jenkins:

```bash
sudo apt-get install jenkins
```

---

## Accessing Jenkins

Once Jenkins is installed, it can be accessed through a web browser.

1. Open Jenkins in your browser using your server's public IP address and port 8080:

```
http://your_public_ip:8080
```

2. Retrieve the initial admin password to complete the setup:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Use this password to unlock Jenkins and proceed with the setup wizard.
