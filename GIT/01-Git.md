What is Git? Git is a Distributed Version Control System (DVCS) designed
to handle everything from small to very large projects efficiently. It
allows multiple developers to work on the same project by tracking
changes, managing versions, and enabling collaboration. • Created by:
Linus Torvalds in 2005. • Primary Purpose: To manage source code and
track changes over time in a collaborative development environment.

Key Features of Git: • Distributed: Every developer has a full copy of
the repository. • Branching and Merging: Allows experimentation with
features or bug fixes without affecting the main codebase. •
Lightweight: Efficient in terms of performance and storage. • Integrity:
Ensures data integrity using cryptographic hash functions (SHA-1). •
Speed: Optimized for fast operations, such as commits, branches, and
merges.

What is a Version Control System (VCS)? A Version Control System (VCS)
is a tool that helps manage changes to source code over time. It allows
developers to: • Track changes. • Collaborate effectively. • Revert to
previous versions if needed. • Identify who made changes and when.

Types of VCS 1. Centralized Version Control System (CVCS) o A single,
central repository stores all the versions of code. o Developers pull
code from the central server, work on it, and then commit changes back.
o Examples: Subversion (SVN), Perforce, CVS.

Advantages: o Simple to understand and implement. o Centralized control
ensures consistency.

Disadvantages: o Single point of failure: If the central server crashes,
all changes may be lost. o Limited offline capabilities: Developers
cannot commit changes without a connection to the server.

Workflow Example (CVCS): o Developer A checks out code from the central
repository. o Developer A modifies the code and commits it back to the
central repository. o Developer B updates their local copy with
Developer A's changes by pulling from the repository.

2.  Distributed Version Control System (DVCS) o Every developer has a
    full copy of the repository, including its history. o Developers can
    work offline, commit changes locally, and later synchronize with
    others. o Examples: Git, Mercurial, Bazaar.

Advantages: o Full offline access: Developers can work independently
without relying on a central server. o Redundancy: Each copy of the
repository serves as a backup. o Better collaboration: Enables
branching, merging, and experimenting without affecting the main
repository.

Disadvantages: o Requires more disk space because every developer has a
full copy. o Slightly steeper learning curve compared to CVCS.

Workflow Example (DVCS): o Developer A clones the repository locally. o
Developer A commits changes locally. o Developer A pushes changes to the
remote repository, where Developer B can pull them.

Git vs. Centralized VCS Feature CVCS (e.g., SVN) DVCS (e.g., Git)
Repository Structure Single central server Each developer has a full
copy Offline Work Limited or no offline capabilities Full offline
capabilities Speed Slower (network-dependent) Faster (local operations)
Backup Single point of failure Every clone is a backup Branching
Expensive and slow Lightweight and fast

Git vs. GitHub vs. GitLab Git • A distributed version control system. •
Command-line tool to manage source code versions locally and remotely. •
Allows developers to create repositories, branch, merge, and
collaborate. • Key Commands: o git init: Initialize a repository. o git
clone: Clone a repository. o git add: Stage changes. o git commit: Save
changes locally. o git push: Upload changes to a remote repository. o
git pull: Fetch and merge changes from the remote repository.

GitHub • A hosted Git repository platform that provides additional
features for collaboration. • Owned by Microsoft, GitHub offers
web-based tools for Git repositories. • Includes features like pull
requests, issues, project management tools, and actions for CI/CD. •
Primary Use: Collaborative software development and open-source hosting.

Key Features of GitHub: • Graphical user interface for managing Git
repositories. • Integration with CI/CD tools like GitHub Actions. •
Open-source project hosting with visibility controls. • Integration with
third-party tools like Slack, Trello, etc.

GitLab • An open-source Git repository platform with integrated DevOps
tools. • Offers more built-in features than GitHub, including CI/CD
pipelines, issue tracking, wiki, and container registry. • Available as
a self-hosted solution or SaaS. • Primary Use: End-to-end DevOps
automation with Git integration.

Key Features of GitLab: • Built-in CI/CD for automated builds and
deployments. • Self-hosting capability for private repositories. •
Container image storage via Container Registry. • Integrated Kubernetes
management.

Git vs. GitHub vs. GitLab Comparison Feature Git GitHub GitLab Type
Version control system Git repository hosting platform Git repository
hosting platform Usage Command-line based GUI for collaboration GUI for
collaboration and CI/CD Platform Local + CLI SaaS SaaS + self-hosted
CI/CD Integration None Limited (via GitHub Actions) Built-in CI/CD
Visibility Repository Local + Remote Public or Private Repositories
Public or Private Repositories DevOps Integration No Partial Full DevOps
lifecycle Target Audience Developers Developers and Teams Developers,
Teams, and Enterprises Example CLI: git add . Web UI for pull requests
Built-in CI pipelines

Conclusion • Git is a powerful distributed version control system,
foundational for modern development. • GitHub and GitLab extend Git by
adding features for collaboration, project management, and CI/CD. •
Choose GitHub for community projects and simpler integrations. Choose
GitLab for enterprises and comprehensive DevOps workflows.
