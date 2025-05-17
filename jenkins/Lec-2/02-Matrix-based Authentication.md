# ✅ Matrix-based Authentication in Local Jenkins Setup

This guide walks you through setting up **Matrix-based authorization** in a local Jenkins installation using the **Jenkins internal user database**.

---

## 🧩 Step 1: Enable Security & Matrix Authorization

1. Open Jenkins: [http://localhost:8080](http://localhost:8080)
2. Navigate to: **Manage Jenkins** → **Configure Global Security**
3. Under **Authorization**, select:
   - ✅ **Matrix-based security**
4. Under **Security Realm**, select:
   - ✅ **Jenkins’ own user database**

---

## 👥 Step 2: Create Local Users

Go to: **Manage Jenkins** → **Manage Users** → **Create User**

Create users like:

| Username    | Password | Role     |
|-------------|----------|----------|
| admin1      | admin123 | Admin    |
| developer1  | dev123   | Developer |
| viewer1     | view123  | Viewer   |

### Example Form:

```
Username: developer1
Password: dev123
Full Name: Developer One
Email: dev1@example.com
```

---

## 🔐 Step 3: Assign Matrix Permissions

Still in **Configure Global Security**, under the matrix:

1. Click **Add User or Group**
2. Add:
   - `admin1`
   - `developer1`
   - `viewer1`

### Example Matrix Configuration:

| User         | Overall.Read | Overall.Administer | Job.Read | Job.Build | Job.Configure |
|--------------|--------------|--------------------|----------|-----------|----------------|
| **admin1**     | ✅           | ✅                 | ✅       | ✅        | ✅             |
| **developer1** | ✅           | ❌                 | ✅       | ✅        | ❌             |
| **viewer1**    | ✅           | ❌                 | ✅       | ❌        | ❌             |

> ⚠️ **IMPORTANT**: Ensure at least one user (e.g. `admin1`) has **Overall → Administer**, or you may lock yourself out.

---

## 💾 Step 4: Save Configuration

Click the **Save** button at the bottom of the page.

---

## 🧪 Step 5: Test User Access

1. **Log out**
2. **Log in as each user**:
   - `admin1` → Full access
   - `developer1` → Read & build only
   - `viewer1` → Read-only
3. Confirm access:
   - View dashboard
   - Build jobs
   - Configure jobs
   - Access system settings

---

## 🛡️ Best Practices

- ✅ Always keep one admin user with full permissions.
- ✅ Use groups instead of individual usernames where possible.
- ✅ Backup `$JENKINS_HOME/config.xml` before making permission changes.
- ✅ Test user roles regularly.

---

## 🔌 Optional Plugin for Testing: Impersonate User

Install the **Impersonate User** plugin to easily test roles without logging in/out:

- Go to: a user profile → Click **"Impersonate"**.

---

## 📂 File Info

- **Filename**: `matrix-authentication-jenkins.md`
- **Purpose**: Local Jenkins security setup with matrix-based permissions
