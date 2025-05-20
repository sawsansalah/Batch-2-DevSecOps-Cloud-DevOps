 Jenkins Webhook Trigger Configuration Guide

This guide provides step-by-step instructions to configure Jenkins jobs that are triggered by GitHub webhooks.

---

## 📌 Part 1: Triggering a Jenkins Pipeline Using Generic Webhook Trigger Plugin

### Step 1: Install Generic Webhook Trigger Plugin

1. Go to **Jenkins Dashboard**.
2. Navigate to **Manage Jenkins** → **Manage Plugins**.
3. Under the **Available** tab, search for **Generic Webhook Trigger**.
4. Install the plugin and restart Jenkins if necessary.

### Step 2: Configure Jenkins Job

1. Create or open the Jenkins job (freestyle or pipeline) you want to trigger.
2. In the job configuration, scroll to the **Build Triggers** section.
3. Check **Generic Webhook Trigger**.

### Step 3: Configure Post Parameters

1. In the **Post content parameters** section:
   - Add a new parameter.
   - Set **Variable** to `ref`.
   - Set **Expression (JSONPath)** to `$.ref`.

### Step 4: Set a Webhook Token

1. In the **Token** field, write a string (e.g., `github_token`) that will be used as a key in the webhook URL.

### Step 5: Optional Branch Filter

1. In the **Optional Filter** section:
   - **Expression**: `refs/heads/branch_name` (replace `branch_name` with the actual branch name, e.g., `main`).
   - **Text**: `$ref`

### Step 6: Configure GitHub Webhook

1. Go to your GitHub repository **Settings**.
2. Navigate to **Webhooks**.
3. Click **Add webhook**.
4. In **Payload URL**, enter:

   ```
   http://<JENKINS_URL>/generic-webhook-trigger/invoke?token=github_token
   ```

   Example:

   ```
   http://65.0.31.109:8080/generic-webhook-trigger/invoke?token=github_token
   ```

5. Set **Content type** to `application/json`.
6. Choose **Just the push event** or other relevant events.

### Step 7: Save Jenkins Job

1. Save your Jenkins job configuration.
2. Your job will now trigger when a push event occurs on the specified branch.

---

## 📌 Part 2: Triggering a Multibranch Pipeline Using Multibranch Scan Webhook Trigger Plugin

### Step 1: Install Multibranch Scan Webhook Trigger Plugin

1. Go to **Jenkins Dashboard**.
2. Navigate to **Manage Jenkins** → **Manage Plugins**.
3. Under the **Available** tab, search for **Multibranch Scan Webhook Trigger**.
4. Install the plugin and restart Jenkins if required.

### Step 2: Configure Multibranch Pipeline Job

1. Create or open a **Multibranch Pipeline** job.
2. In job configuration, scroll to **Scan Multibranch Pipeline Triggers**.
3. Check **Scan by webhook**.
4. Enter a **Trigger token** (e.g., `DevopsTeam`).

### Step 3: Configure GitHub Webhook

1. Go to your GitHub repository **Settings**.
2. Navigate to **Webhooks**.
3. Click **Add webhook**.
4. In **Payload URL**, enter:

   ```
   http://<JENKINS_URL>/multibranch-webhook-trigger/invoke?token=DevopsTeam
   ```

   Example:

   ```
   http://65.0.31.109:8080/multibranch-webhook-trigger/invoke?token=DevopTeam
   ```

5. Set **Content type** to `application/json`.
6. Select events such as **Pushes**.

### Step 4: Save Jenkins Job

1. Save your multibranch pipeline job configuration.
2. Jenkins will now scan and build branches on push events.

---

