# Git Preferences

- When updating PRs, make new commits instead of amending/rebasing
- People may be reviewing or collaborating on PRs, so preserve commit history
- When working on a new branch, use git worktrees to keep the main workspace on the default branch
- Create worktrees in sibling directories with a suffix like `-<branch-name>` (e.g., `project-feature-branch`)
- After creating a worktree, tell the user the path so they can `cd` into it (e.g., "Worktree created at `../project-feature-branch`")
- Exception: do not use worktrees for monorepos. For monorepos, create the branch directly in the current workspace instead.
- See `local.md` for the specific repos this applies to
- When pushing a branch for the first time, use `-u` / `--set-upstream` to set up tracking (e.g., `git push -u origin branch-name`)
