# GitHub Preferences

- Prefer `gh` CLI tool over GitHub API for creating PRs and other GitHub
  operations
- If the GitHub API tool fails with 403 (e.g. SAML SSO enforcement on an
  organization), fall back to `gh`; known affected organizations may be
  listed in `local.md`
- When replying to GitHub review comments, prefix the reply with `ai: `
  (e.g. `ai: Fixed in abc1234`)

