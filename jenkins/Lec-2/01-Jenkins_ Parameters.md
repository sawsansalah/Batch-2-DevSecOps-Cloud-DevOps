# Jenkins Pipeline Parameters Guide

## 1. 📘 Introduction to Jenkins Pipeline Parameters

Pipeline parameters in Jenkins allow customization and dynamic control of pipeline execution. By using parameters, users can provide input at build time, enabling pipelines to adapt based on runtime data.

---

## 2. 🎛️ Types of Parameters

Jenkins supports various parameter types:
- **String**
- **Boolean**
- **Choice**
- **Password**
- **File**
- **Text**
- **Credentials**

Each serves a different purpose depending on the input required.

---

## 3. 📝 String Parameter

### Syntax:
```groovy
string(name: 'STRING_PARAM', defaultValue: 'default value', description: 'Enter a string value')
```

```groovy
pipeline {
    agent any
    parameters {
        string(name: 'Branch_Name', defaultValue: 'main', description: 'Enter Branch Name')
    }
    stages {
        stage('Git') {
            steps {
                script {
                    git branch: params.Branch_Name, url: 'https://github.com/sawsansalah/FullStack-Blogging-App.git'
                }
            }
        }
        
    }
}

```
### Explanation:
- Accepts free-text input.
- Commonly used for names, tags, version numbers, etc.

---

## 4. ✅ Boolean Parameter

### Syntax:
```groovy
booleanParam(name: 'BOOLEAN_PARAM', defaultValue: true, description: 'Enable or disable something')
```

### Explanation:
- Used for true/false inputs.
- Useful for toggling features, skipping tests, etc.

---

## 5. 🔘 Choice Parameter

### Syntax:
```groovy
choice(name: 'CHOICE_PARAM', choices: ['Option 1', 'Option 2', 'Option 3'], description: 'Select an option')
```
```groovy
pipeline {
    agent any
    parameters {
        choice(name: 'Branch_Name', choices: ['main', 'QA', 'Dev'], description: 'Select an option')

    }
    stages {
        stage('Git') {
            steps {
                script {
                    git branch: params.Branch_Name, url: 'https://github.com/sawsansalah/FullStack-Blogging-App.git'
                }
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
```


### Explanation:
- Dropdown input with fixed choices.
- Controls flow or behavior based on selected option.

---

## 6. 🔒 Password Parameter

### Syntax:
```groovy
password(name: 'PASSWORD_PARAM', defaultValue: 'password', description: 'Enter your password')
```

### Explanation:
- For secure password input.
- Masked in logs for security.

---

## 7. 📁 File Parameter

### Syntax:
```groovy
file(name: 'FILE_PARAM', description: 'Upload a file')
```

### Explanation:
- Allows file uploads during build time.
- Useful for uploading config files or scripts.

---

## 8. 📄 Text Parameter

### Syntax:
```groovy
text(name: 'TEXT_PARAM', defaultValue: 'default text', description: 'Enter multi-line text')
```

### Explanation:
- For multi-line input like JSON, XML, or logs.

---

## 9. 🔐 Credentials Parameter

### Syntax:
```groovy
credentials(name: 'CREDENTIALS_PARAM', description: 'Select credentials', credentialType: 'com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl')
```

### Explanation:
- Securely pass credentials managed by Jenkins.
- Supports various credential types like username/password, secret text, SSH keys.

---

## 10. 🏗️ Using Parameters in Stages

### Example:
```groovy
pipeline {
    agent any
    parameters {
        string(name: 'STRING_PARAM', defaultValue: 'hello', description: 'Enter a string')
        booleanParam(name: 'BOOLEAN_PARAM', defaultValue: true, description: 'Enable or disable')
        choice(name: 'CHOICE_PARAM', choices: ['Dev', 'QA', 'Prod'], description: 'Select environment')
        password(name: 'PASSWORD_PARAM', defaultValue: 'secret', description: 'Enter password')
        file(name: 'FILE_PARAM', description: 'Upload a file')
        text(name: 'TEXT_PARAM', defaultValue: 'Default\nText', description: 'Enter multi-line text')
        credentials(name: 'CREDENTIALS_PARAM', description: 'Select credentials', credentialType: 'com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl')
    }
    stages {
        stage('Display Parameters') {
            steps {
                script {
                    echo "STRING_PARAM: ${params.STRING_PARAM}"
                    echo "BOOLEAN_PARAM: ${params.BOOLEAN_PARAM}"
                    echo "CHOICE_PARAM: ${params.CHOICE_PARAM}"
                    echo "PASSWORD_PARAM: ${params.PASSWORD_PARAM}"
                    echo "FILE_PARAM: ${params.FILE_PARAM}"
                    echo "TEXT_PARAM: ${params.TEXT_PARAM}"
                    echo "CREDENTIALS_PARAM: ${params.CREDENTIALS_PARAM}"
                }
            }
        }
    }
}
```

---


##. 📌 Conclusion

Pipeline parameters are a powerful tool in Jenkins, enabling dynamic, flexible, and secure pipeline execution. By combining different parameter types, you can create interactive and reusable pipelines for a wide range of CI/CD workflows.
