Git Revert vs Git Reset: Complete Guide
Here's a comprehensive guide to understanding and using git revert and git reset commands in Git, all in one downloadable file.

Table of Contents
Overview

Git Revert

Git Reset

Comparison Table

When to Use Each Command

Best Practices

Overview <a name="overview"></a>
Feature	Git Revert	Git Reset
Purpose	Undo changes by creating a new commit	Undo changes by moving the branch pointer
History	Preserves commit history	Rewrites commit history
Use Case	Safe for shared/public branches	Best for local/private branches
Impact	Creates a new commit to reverse changes	Modifies working directory and staging area
Modes	No modes (always creates a new commit)	--soft, --mixed, --hard
Git Revert <a name="git-revert"></a>
git revert creates a new commit that reverses the changes introduced by a specific commit, preserving history.

Syntax
bash
git revert <commit-hash>
Examples
1. Reverting a Single Commit
Scenario: You want to undo the changes from a specific commit that introduced a bug.

bash
# View commit history
git log --oneline

# Revert the problematic commit
git revert d4e5f1a

# Result: A new commit is created that reverses the changes
2. Reverting Multiple Commits
bash
# Revert multiple commits in sequence
git revert d4e5f1a
git revert c2b4a8b
3. Reverting with Conflicts
bash
# If conflicts occur during revert
git revert <commit-hash>
# Resolve conflicts manually
git add <resolved-files>
git revert --continue
Git Reset <a name="git-reset"></a>
git reset moves the branch pointer to a previous commit, with different modes affecting the working directory and staging area.

Modes
Mode	Working Directory	Staging Area	Use Case
--soft	No change	Changes kept staged	Undo commits but keep changes staged
--mixed	No change	Changes unstaged	Undo commits and unstage changes (default)
--hard	Changes discarded	Cleared	Completely remove commits and changes
Syntax
bash
git reset [<mode>] <commit-hash>
Examples
1. Mixed Reset (Default)
bash
# Reset to a specific commit, keeping changes as unstaged
git reset a7c3d9e
2. Soft Reset
bash
# Undo last commit but keep changes staged
git reset --soft HEAD~1
3. Hard Reset
bash
# Completely remove last commit and all changes
git reset --hard HEAD~1

# WARNING: This permanently discards changes!
4. Unstaging Changes
bash
# Unstage all currently staged changes
git reset

# Unstage a specific file
git reset -- <file-name>
Comparison Table <a name="comparison-table"></a>
Feature	Git Revert	Git Reset
History Preservation	Creates new commit, preserves history	Moves branch pointer, rewrites history
Safety	Safe for shared branches	Riskier, best for local branches
Working Directory	No impact	Impact depends on mode
Use Case	Public undo operations	Local history rewriting
Collaboration	Safe for teams	Can cause issues in shared repos
When to Use Each Command <a name="when-to-use-each-command"></a>
Use Git Revert When:
You need to undo changes on a shared or public branch

You want to preserve the complete commit history

You're working with a team and need a safe undo operation

You need to undo specific commits without affecting later work

Use Git Reset When:
You're working on a local branch and want to rewrite history

You need to completely remove recent commits

You want to unstage changes without committing them

You're sure the changes won't affect other collaborators

Best Practices <a name="best-practices"></a>
Avoid Data Loss

Use git reset --soft or --mixed when unsure about discarding changes

Only use --hard when absolutely certain you don't need the changes

Consider creating a backup branch before performing destructive operations

Team Collaboration

Prefer git revert when working with shared branches

Communicate with your team before using git reset on shared history

Use git push --force-with-lease instead of --force when updating remote branches

Efficient History Management

For multiple undo operations, consider interactive rebase instead of multiple reverts

Use git reflog to recover from mistaken reset operations

Documentation

Write clear commit messages when reverting changes

Consider adding context to revert commits explaining why the change was reverted

Quick Reference Cheat Sheet
bash
# Revert a specific commit (safe for shared branches)
git revert <commit-hash>

# Reset to previous commit, keeping changes staged
git reset --soft HEAD~1

# Reset to previous commit, keeping changes unstaged
git reset --mixed HEAD~1

# Completely remove last commit and changes (use with caution!)
git reset --hard HEAD~1

# Unstage all changes without affecting commits
git reset

# Unstage a specific file
git reset -- <filename>
Recovery Tips
If you accidentally reset too far or use the wrong mode:

Use git reflog to find the previous state

Note the commit hash from before the reset

Reset again to that commit: git reset --hard <old-commit-hash>

Download This Guide
To save this guide as a PDF for offline reference:

Print this page (Ctrl+P or Cmd+P)

Change the destination to "Save as PDF"

Click "Save"

This guide is intended for educational purposes. Always ensure you have backups before performing destructive Git operations.
