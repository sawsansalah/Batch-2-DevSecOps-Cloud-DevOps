# Jenkins Setup and Job Configuration Guide

## Installing Plugins & Configuring JDK

### Step 1: Installing Plugins

1. Navigate to **Manage Jenkins** → **Manage Plugins**.
2. Under the **Available** tab, search for **"Eclipse Temurin Installer"**.
3. Install the plugin.

### Step 2: Configuring JDK

1. Go to **Manage Jenkins** → **Global Tool Configuration** → **JDK installations**.
2. Add a JDK installation:
   - Provide a name for the JDK.
   - Select the **"Install automatically"** option.
   - Choose **"Install from adoptium.net"** and configure **JDK 17**.

> This configuration ensures that your Jenkins instance can use JDK 17 for various tasks.

---

## Jenkins Job Types

In Jenkins, different types of jobs allow you to define and automate various stages of the software development lifecycle:

### 1. Freestyle Project

- General-purpose job type.
- Define a series of build steps (shell commands, scripts, etc.).
- Suitable for simple projects without complex workflows.

### 2. Pipeline Project

- Uses the Jenkins Pipeline plugin.
- Define workflows as code using a **Jenkinsfile**.
- Supports **declarative** and **scripted** syntax.
- Ideal for complex, customizable pipelines.

### 3. Multibranch Pipeline

- Automatically creates sub-jobs for each branch in a repository.
- Best suited for CI/CD pipelines across multiple branches.

---

## Creating and Configuring a Freestyle Jenkins Job

### Step 1: Access Jenkins

- Log in to the Jenkins web interface.

### Step 2: Create a New Freestyle Job

1. Click on **"New Item"** on the dashboard.
2. Enter a job name (e.g., `MyFreestyleJob`).
3. Select **"Freestyle project"** and click **OK**.

### Step 3: Configure General Settings

- In the **General** section:
  - Add a description (optional).
  - Enable **"Discard old builds"** to manage retention.

### Step 4: Configure Source Code Management (Optional)

- Select an SCM (Git, Subversion, etc.).
- Provide repository details.

### Step 5: Configure Build Steps

Choose one or more of the following:
1. **Execute Shell** – Run shell scripts.
2. **Execute Windows Batch Command** – For Windows environments.
3. **Invoke Ant** – Run Apache Ant builds.
4. **Invoke Gradle** – Run Gradle tasks.
5. **Invoke Maven** – Compile and build Java projects with Maven.

### Step 6: Configure Post-Build Actions

- **Archive the Artifacts** – Store JARs, reports, etc.
- **Publish JUnit Test Result Report** – Show unit test results.
- **Send Build Artifacts Over SSH** – Transfer builds to remote servers.

### Step 7: Configure Build Triggers (Optional)

- **Build Periodically** – e.g., nightly builds.
- **Poll SCM** – Check for repository changes.

### Step 8: Save Configuration

- Click **Save** to persist your job settings.

### Step 9: Run the Job

- Click **"Build Now"** to start the job.

### Step 10: View Build Results

- Check build output, artifacts, and test results under **Build History**.

---

## Jenkins Pipeline Job (Declarative Example)


```groovy
pipeline {
    agent any
    tools {
        jdk 'JDK17'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/project.git'
            }
        }
        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
    }
    
}
```groovy

---
## Explanation

1. **Agent**:  
   The `agent any` directive tells Jenkins to run the pipeline on any available agent.

2. **Tools**:  
   The `tools` block specifies the tools required by the pipeline, such as JDK and Maven.  
   Replace `'jdk_name'` and `'maven_name'` with the actual tool names configured in Jenkins.

3. **Stages**:  
   The `stages` block defines the various stages of the pipeline. Each stage represents a step in the CI/CD process:

   - **Checkout**:  
     Checks out the source code from the Git repository.

   - **Compile**:  
     Compiles the source code using Maven.

   - **Test**:  
     Runs tests using Maven.

   - **Package**:  
     Packages the application (e.g., creating a JAR file).
