# Git Stash Pop: A Comprehensive Guide

The `git stash pop` command is used to reapply stashed changes to your working directory and remove the stash from the stash list.  
It is a combination of `git stash apply` (which reapplies stashed changes without removing them) and `git stash drop` (which deletes the stash entry).

---

## Why Use `git stash pop`?
1. Temporarily save work-in-progress changes when switching branches or working on a new task.  
2. Reapply those saved changes later and remove them from the stash.

---

## How `git stash pop` Works
1. **Save Work-in-Progress (WIP):**
   - You make changes to your working directory but don’t want to commit yet.  
   - Use `git stash` to temporarily save these changes.  

2. **Switch Context:**  
   - You switch branches or tasks to address something else.  

3. **Reapply Stashed Changes:**  
   - After completing the other work, you return and use `git stash pop` to reapply the changes and remove the stash entry.  

---

## Basic Workflow with `git stash pop`
### 1. Stash Changes:
```bash
git stash
```
This saves your current uncommitted changes (both staged and unstaged) and restores the working directory to the last commit.

### 2. Check Stash List:
```bash
git stash list
```
This shows all saved stashes.

### 3. Apply and Remove the Most Recent Stash:
```bash
git stash pop
```

---

## Examples

### Example 1: Stashing Changes While Switching Branches
```bash
# Step 1: Make Changes
echo "Temporary work" > temp.txt
git add temp.txt

# Step 2: Save Changes
git stash   # working directory is now clean

# Step 3: Switch Branch
git checkout main

# Step 4: Do Work on main
echo "Bug fix on main" > fix.txt
git add fix.txt
git commit -m "Bug fix on main branch"

# Step 5: Switch Back
git checkout feature

# Step 6: Restore Stash
git stash pop   # temp.txt is restored
```

---

### Example 2: Conflict Resolution During `git stash pop`
If the stashed changes conflict with the current working directory, Git will pause and report conflicts.

**Scenario:**
1. `example.txt` exists in both the stash and current branch with different changes.  
2. Running `git stash pop` results in a conflict.

**Steps:**
```bash
# Create a conflict
echo "Work in progress" >> example.txt
git add example.txt
git stash

echo "Different changes" >> example.txt
git add example.txt
git commit -m "New changes in current branch"

# Reapply stash (conflict happens)
git stash pop
# Git outputs:
# Auto-merging example.txt
# CONFLICT (content): Merge conflict in example.txt

# Resolve conflict
nano example.txt   # fix conflicts
git add example.txt

# Drop stash (if not already removed)
git stash drop
```

---

### Example 3: Applying a Specific Stash
```bash
# Create multiple stashes
echo "Change 1" > file1.txt
git add file1.txt
git stash

echo "Change 2" > file2.txt
git add file2.txt
git stash

# Check stashes
git stash list
# stash@{0}: WIP on feature: Change 2
# stash@{1}: WIP on feature: Change 1

# Apply a specific stash
git stash pop stash@{1}
```

---

## Key Commands
| Command | Description |
|---------|-------------|
| `git stash` | Save current changes to the stash. |
| `git stash list` | List all stashed changes. |
| `git stash pop` | Apply the most recent stash and remove it. |
| `git stash pop stash@{n}` | Apply and remove a specific stash. |
| `git stash apply` | Apply a stash without removing it. |
| `git stash drop` | Remove a specific stash. |
| `git stash clear` | Remove all stashes. |

---

## When to Use `git stash pop`
1. **Quick Work Context Switch** – temporarily save incomplete work when switching to another task.  
2. **Restoring WIP Safely** – restore changes after returning to the original branch.  
3. **Single-Use Stash** – use `git stash pop` when you don’t need to keep the stash after applying it.  

---

## Tips and Best Practices
1. Use `git stash list` regularly to avoid confusion with multiple stashes.  
2. Add descriptive messages for clarity:  
   ```bash
   git stash save "Added initial code for feature X"
   ```
3. Carefully resolve conflicts during stash pops.  
4. Avoid using stashes as long-term storage — commit frequently instead.  

---
