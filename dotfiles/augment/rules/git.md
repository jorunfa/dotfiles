# Git Preferences

- When updating PRs, make new commits instead of amending/rebasing
- People may be reviewing or collaborating on PRs, so preserve commit history
- When working on a new branch, always use git worktrees to keep the main workspace on the default branch
- Create worktrees in sibling directories with a suffix like `-<branch-name>` (e.g., `project-feature-branch`)
- After creating a worktree, tell the user the path so they can `cd` into it (e.g., "Worktree created at `../project-feature-branch`")
- When pushing a branch for the first time, use `-u` / `--set-upstream` to set up tracking (e.g., `git push -u origin branch-name`)
