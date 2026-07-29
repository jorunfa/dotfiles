# Notification Preferences

- After long-running operations (>30 seconds), play a sound and send a notification using `terminal-notifier`
- Use the following command pattern:
  ```fish
  set focus_id ($HOME/bin/ghostty-focus --id)
  terminal-notifier -title 'Augment' -message '<operation description>' -sound 'default' -execute "$HOME/bin/ghostty-focus $focus_id"
  ```
- `ghostty-focus` resolves the Ghostty surface (tab/split) the current process runs in, so clicking the notification jumps straight back to the right tab instead of just raising the app
- Use the absolute `$HOME/bin/` path: `-execute` runs through `/bin/sh`, which does not inherit the interactive PATH
- If `ghostty-focus --id` fails (not running under Ghostty), fall back to `-activate com.mitchellh.ghostty`
- Examples of long-running operations:
  - Running test suites
  - Building projects
  - Installing dependencies
  - Running linters or formatters on large codebases
  - Long-running searches or analysis
- Always include a descriptive message about what completed
- Use "default" sound or "Glass" for success, "Basso" for errors

