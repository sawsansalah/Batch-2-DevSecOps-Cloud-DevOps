# Git Basic Workflow

Git workflows refer to the structured way developers use Git to manage changes in a
project, ensuring collaboration, consistency, and efficient version control. Below is a detailed
breakdown of a Git workflow, from initialization to collaboration and deployment.

---

## 1. Initialize a Repository

A Git repository is the starting point. It can be created for a new project or initialized in an
existing directory.

**Example:**

```bash
# Step 1: Navigate to your project folder
cd my-project

# Step 2: Initialize a Git repository
git init
```

This creates a `.git` folder in the project directory, which stores all Git-related metadata.

---

## 2. Create and Stage Files

Once the repository is initialized, files are created or modified and staged for tracking.

**Example:**

```bash
# Step 1: Create a file
echo "Hello, World!" > hello.txt

# Step 2: Stage the file
git add hello.txt
```

The `git add` command stages the file, preparing it to be committed. You can stage multiple
files or an entire directory using:

```bash
git add .
```

---

## 3. Commit Changes

A commit saves the changes in the repository's history.

**Example:**

```bash
git commit -m "Initial commit: Add hello.txt"
```

- `-m`: Adds a message describing the changes.  
- Commits represent a snapshot of the repository at a specific point.

---

## 4. Connect to a Remote Repository

To share your work, connect your local repository to a remote one (e.g., GitHub, GitLab).

**Example:**

```bash
# Step 1: Add a remote repository
git remote add origin https://github.com/username/my-project.git

# Step 2: Verify the remote repository
git remote -v
```

This associates your local repository with a remote repository named `origin`.

---

## 5. Push Changes to the Remote Repository

Upload commits from the local repository to the remote.

**Example:**

```bash
git push -u origin main
```

- `-u`: Sets the upstream branch so future pushes can be done with `git push`.  
- This command uploads the `main` branch to the `origin` remote.

---

# Git Revert vs Git Reset

`git revert` and `git reset` are powerful tools for undoing changes in Git, but they work very
differently and serve distinct purposes. This guide explains their differences, use cases, and detailed
examples.

---

## Overview

| Feature      | Git Revert | Git Reset |
|--------------|------------|-----------|
| **Purpose**  | Undo changes by creating a new commit. | Undo changes by moving the branch pointer. |
| **History**  | Preserves commit history. | Rewrites commit history (in some cases). |
| **Use Case** | Safe for shared/public branches. | Typically used on local/private branches. |
| **Impact**   | Creates a new commit to reverse changes. | Modifies the working directory and staging area. |
| **Modes**    | No modes (always creates a new commit). | `--soft`, `--mixed`, `--hard`. |

---

## Git Revert

`git revert` creates a new commit that reverses the changes introduced by a specific commit. It does
not remove the original commit from the history, making it safe to use on shared branches.

**Syntax:**

```bash
git revert <commit-hash>
```

### Example 1: Reverting a Single Commit
**Scenario:**

You have the following commit history:

```
A --- B --- C --- D (main)
```

Commit D introduces a bug. To undo it:

```bash
git revert D
```

New history:

```
A --- B --- C --- D --- E (main)
```

- Commit E is a new commit that reverses the changes from D.  
- Commit D still exists in history.

---

## Git Reset

`git reset` moves the branch pointer to a previous commit. Depending on the mode, it can also modify
the staging area and working directory.

**Syntax:**

```bash
git reset [--soft | --mixed | --hard] <commit-hash>
```

### Modes of Reset

1. **Soft Reset (`--soft`)**
   - Moves HEAD to the specified commit.
   - Keeps changes staged (in the index).
   - Use when you want to redo the commit but keep changes staged.

   ```bash
   git reset --soft <commit-hash>
   ```

2. **Mixed Reset (`--mixed`)** *(default mode)*
   - Moves HEAD to the specified commit.
   - Keeps changes in the working directory but unstaged.
   - Use when you want to re-stage changes differently.

   ```bash
   git reset --mixed <commit-hash>
   ```

3. **Hard Reset (`--hard`)**
   - Moves HEAD to the specified commit.
   - Discards all changes in the working directory and staging area.
   - **Dangerous**: Irreversible if commits are not pushed.

   ```bash
   git reset --hard <commit-hash>
   ```

---

### Example 2: Resetting Commits
**Scenario:**

History:

```
A --- B --- C --- D (main)
```

Run:

```bash
git reset --hard B
```

New history:

```
A --- B (main)
```

- Commits C and D are deleted from the current branch.  
- If not pushed, they may be lost permanently.

---

## Key Differences Between Revert and Reset

1. **History Preservation**
   - Revert: Keeps history intact by adding a new commit.  
   - Reset: Rewrites history by moving the branch pointer.

2. **Safety**
   - Revert: Safe for public branches.  
   - Reset: Risky on shared branches (can cause conflicts).

3. **Use Cases**
   - Revert: Undo specific commits without altering history.  
   - Reset: Clean up local history or undo recent commits before pushing.

---

## Best Practices

- Use **`git revert`** on shared branches to avoid conflicts.  
- Use **`git reset`** on local/private branches to rewrite history.  
- Always double-check with `git log` or `git status` before running reset commands.  
- When in doubt, create a backup branch before using reset:

```bash
git branch backup-main
```


