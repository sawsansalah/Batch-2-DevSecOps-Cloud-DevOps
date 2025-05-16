# Setting Up Webhook Triggers in Jenkins

This guide explains how to configure Jenkins jobs to be triggered via webhooks from GitHub using:

- **Generic Webhook Trigger Plugin** (for freestyle or pipeline jobs)
- **Multibranch Scan Webhook Trigger Plugin** (for multibranch pipeline jobs)

---

## Part 1: Generic Webhook Trigger (Single Pipeline Job)

### Step 1: Install Generic Webhook Trigger Plugin

1. Go to Jenkins dashboard.
2. Navigate to **Manage Jenkins** → **Manage Plugins**.
3. Under the **Available** tab, search for **Generic Webhook Trigger**.
4. Install the plugin and restart Jenkins if required.

### Step 2: Configure Jenkins Job

1. Create or open the Jenkins job you want to trigger.
2. In the job configuration, scroll to the **Build Triggers** section.
3. Check the box for **Generic Webhook Trigger**.

### Step 3: Configure Post Parameters

1. In the **Post content parameters** section, click **Add**.
2. Enter:
   - **Variable**: `ref`
   - **Expression (JSONPath)**: `$.ref`

### Step 4: Set a Token

1. Enter a **token string** (e.g., `github_token`) — this will be used in the webhook URL.

### Step 5: Optional Filter (Branch Specific Trigger)

1. In the **Optional Filter** section, configure:
   - **Expression**: `refs/heads/branch_name`  
     *(Replace `branch_name` with the actual branch name, e.g., `main`)*
   - **Text**: `$ref`

### Step 6: Configure GitHub Webhook

1. Go to your GitHub repository **Settings**.
2. Navigate to **Webhooks**.
3. Click **Add webhook**.
4. In **Payload URL**, enter:

