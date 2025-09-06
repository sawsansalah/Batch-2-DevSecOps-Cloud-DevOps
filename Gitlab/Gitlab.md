# GitLab CI/CD

CI/CD stands for **Continuous Integration** and **Continuous Deployment/Delivery**.

- **Continuous Integration (CI):** Supports the continuous integration of code changes from various contributors into a shared repository.  
- **Continuous Deployment/Delivery (CD):** Allows automated deployment of code while being developed.

GitLab CI/CD is a set of tools and techniques that automate software development. It enables users to create, test, and deploy code changes inside GitLab and deliver them to end users. The platform ensures consistent workflows and improves both the speed and quality of code delivery.

---

## Features of GitLab CI/CD

- Keeps CI/CD and code management in the same place.
- Cloud-hosted platform, no need to manage servers or databases.
- Flexible subscription plans to suit different budgets.
- Supports multiple test types: unit, integration, and end-to-end.
- Automatically builds and tests code on every push.
- No plugin installation required (built-in support).
- Provides continuous collaboration and version control.

---

## Architecture of GitLab CI/CD

GitLab CI/CD consists of several key components:

### 1. GitLab Server
- Hosts Git repositories and pipelines.  
- Manages pipeline execution and job scheduling.  
- GitLab.com runs on an instance that includes application servers, databases, file storage, and background workers.

### 2. Runners
- Applications that execute CI/CD pipelines.  
- GitLab provides shared runners, but users can configure their own.

### 3. Jobs
- Defined tasks in the pipeline (e.g., build, test, deploy).  
- Each job runs scripts sequentially and must complete before moving on.

### 4. Stages
- Logical groupings of jobs (e.g., **build**, **test**, **deploy**).  
- Ensure that jobs are executed in order.

### 5. Pipeline
- A collection of stages and jobs forming the complete CI/CD process.  
- Types include: basic, multi-branch, merge request, parent-child, scheduled, and multi-job pipelines.

### 6. Commit
- A record of code or file changes, similar to commits in GitHub repositories.  
- Triggers pipelines automatically when pushed.

---

## Example

Here’s a simple GitLab CI/CD pipeline definition (`.gitlab-ci.yml`):

```yaml
stages:
  - build
  - test
  - deploy

build-job:
  stage: build
  script:
    - echo "Building the application..."

test-job:
  stage: test
  script:
    - echo "Running tests..."

deploy-job:
  stage: deploy
  script:
    - echo "Deploying the application..."
