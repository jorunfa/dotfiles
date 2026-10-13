# Notification Preferences

- After long-running operations (>30 seconds), play a sound and send a notification using `terminal-notifier`
- Use the following command pattern (replace `<sound>` and `<operation description>`):
  ```fish
  set action -activate com.mitchellh.ghostty
  if set focus_id ($HOME/bin/ghostty-focus --id 2>/dev/null)
      set action -execute "$HOME/bin/ghostty-focus $focus_id"
  end
  terminal-notifier -title 'Augment' -message '<operation description>' -sound '<sound>' $action
  ```
- `ghostty-focus` resolves the Ghostty surface (tab/split) the current process runs in, so clicking the notification jumps straight back to the right tab instead of just raising the app
- Use the absolute `$HOME/bin/` path: `-execute` runs through `/bin/sh`, which does not inherit the interactive PATH
- If `ghostty-focus --id` fails (not running under Ghostty), the pattern falls back to just raising Ghostty
- Examples of long-running operations:
  - Running test suites
  - Building projects
  - Installing dependencies
  - Running linters or formatters on large codebases
  - Long-running searches or analysis
- Always include a descriptive message about what completed
- `<sound>`: `default` or `Glass` for success, `Basso` for errors

