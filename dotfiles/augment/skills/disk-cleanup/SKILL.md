---
name: disk-cleanup
description: Regain disk space by finding and removing git worktrees that are safe to delete, mainly under ~/tmp/projects. Use when the user asks to clean up, free disk space, or prune old worktrees.
---

# Disk cleanup

Git worktrees created with `git wta` accumulate in `~/tmp/projects` as
`<repo>-<branch>` siblings of the main checkout and can take several GB each.

## Workflow

1. Report current free space: `df -h ~`.
2. Run a dry run (it fetches every main repo and runs `du`, so it can take a few minutes):
   `~/bin/wt-clean --dry-run` (optionally pass another root directory, or `--no-fetch` to skip fetching).
   By default, worktrees committed to or created in the last 3 days are not counted as safe.
3. Summarise the table for the user, grouped by status:
   - `pushed` / `merged`: safe; every commit is on the remote or in a merged PR.
   - `gone:N`: upstream branch was deleted, but N commits are not on any remote.
     Usually a squash-merged PR. Verify with
     `gh pr list --head <branch> --state all --json number,state,headRefOid`
     run inside the worktree before suggesting removal.
   - `unpushed:N`, `dirty`, `locked`: keep. Mention them so the user can decide.
4. Ask the user which worktrees to remove. Recent worktrees may still be in active use.
5. Remove only the paths the user approved. Never run `wt-clean --yes` without `--only`:
   it rescans and would pick up worktrees created since the dry run.
   - Approved `pushed` / `merged` ones, in one call:
     `~/bin/wt-clean --yes --no-fetch --only <path> --only <path> ...`
     This re-checks each status and skips any that are no longer safe.
     Add `--min-age 0` only if the user approved recent ones.
   - Approved `gone` ones (after verifying the PR):
     `git -C <main-checkout> worktree remove <path>`
   Never use `--force` or `rm -rf` on a worktree without explicit user approval.
6. Report free space again with `df -h ~`.

Local branches are kept after removing a worktree; they take no meaningful space.
