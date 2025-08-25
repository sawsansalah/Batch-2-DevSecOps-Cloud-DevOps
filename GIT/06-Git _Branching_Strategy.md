# Comprehensive Guide to Git Branching Strategy

Git branching strategies help organize the development, testing, and deployment processes by isolating code changes in different branches. A well-structured strategy is crucial for managing environments like Development (Dev), Quality Assurance (QA), Pre-Production (PPD), Production (Prod), and Disaster Recovery (DR).

---

## This guide covers:
1. Branching Strategy with Dev, QA, PPD, Prod, and DR  
2. Branching in Feature, Bugfix, and Hotfix Workflows  
3. Code Promotion and Pull Requests  
4. Disaster Recovery Explained  
5. Branching Strategy for QA and Prod  

---

## 1. Branching Strategy for Dev, QA, PPD, Prod, and DR

### Branch Structure
| Branch        | Purpose                                                                 |
|---------------|-------------------------------------------------------------------------|
| **main (prod)** | Production-ready code deployed to end users.                           |
| **dr**        | Backup branch identical to `main`, used for disaster recovery.          |
| **ppd**       | Pre-production testing branch for final validation before deployment.   |
| **qa**        | QA branch for integrated testing.                                       |
| **dev**       | Integration branch where all features are merged and tested first.      |
| **feature/*** | Short-lived branches for feature development.                           |
| **bugfix/***  | Short-lived branches for bug fixes.                                     |
| **hotfix/***  | Emergency fixes for production.                                         |

### Workflow Overview
1. **Feature Development**  
   - Developers create `feature/<name>` branches from `dev`.  
   - After completing development, merge back into `dev`.  

2. **Bug Fixes**  
   - Create `bugfix/<name>` branches from `dev` (or `main` for critical fixes).  
   - Merge fixes into `dev` and test in QA.  

3. **Quality Assurance (QA)**  
   - Merge `dev` into `qa` for testing.  
   - QA validates new features and bug fixes.  

4. **Pre-Production (PPD)**  
   - Merge `qa` into `ppd` for final validation.  
   - PPD simulates production.  

5. **Production Deployment**  
   - Merge `ppd` into `main` for production release.  
   - Sync `main` into `dr` for disaster recovery backup.  

### Example Workflow
```bash
# 1. Create feature branch
git checkout -b feature/login dev

# 2. Develop, commit, and merge to dev
git commit -m "Add login functionality"
git checkout dev
git merge feature/login
git push origin dev

# 3. Merge dev into qa
git checkout qa
git merge dev
git push origin qa

# 4. Merge qa into ppd
git checkout ppd
git merge qa
git push origin ppd

# 5. Merge ppd into main
git checkout main
git merge ppd
git push origin main

# 6. Sync main with dr
git checkout dr
git merge main
git push origin dr
