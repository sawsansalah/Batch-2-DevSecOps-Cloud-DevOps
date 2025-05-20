# Jenkins Integration Guide

This document covers:

- ✅ Connecting Jenkins to a **private GitHub repository** using a Personal Access Token (PAT)
- 🔁 Upstream → Downstream **Pipeline job chaining**
- 🔁 Upstream → Downstream **Freestyle job chaining**


## 🧱 3. Freestyle Job Chaining: Upstream → Downstream

### 🔹 Downstream Freestyle Job (`downstream-job`)

1. Jenkins → New Item → `downstream-job` → **Freestyle project**
2. Check **"This build is parameterized"** → Add **String Parameter**:
   - Name: `BUILD_VERSION`
   - Default value: `latest`
3. Add **Build Step → Execute shell**:
   ```bash
   echo "Received BUILD_VERSION = $BUILD_VERSION"
   ```

---

### 🔹 Upstream Freestyle Job (`upstream-job`)

1. Jenkins → New Item → `upstream-job` → **Freestyle project**
2. Add **Build Step → Execute shell**:
   ```bash
   VERSION="v1.0.$BUILD_NUMBER"
   echo "Calculated version: $VERSION"
   ```
3. Add **Build Step → Trigger/call builds on other projects**:
   - **Project to build**: `downstream-job`
   - ✅ Check "Trigger with parameters"
     - Name: `BUILD_VERSION`
     - Value: `v1.0.$BUILD_NUMBER`

---

## 🔄 Optional Reverse Trigger

If you want the **downstream job to trigger the upstream**, go to the downstream job:

- Configure → Build Triggers → ✅ Check **"Build after other projects are built"**
- Enter the name of the upstream job


