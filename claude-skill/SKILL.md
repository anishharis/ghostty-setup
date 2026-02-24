---
name: ghostty-setup
description: Set up a full Ghostty terminal environment with shell plugins, tools, and configs on a fresh Mac.
disable-model-invocation: true
allowed-tools: Bash(*), Read, Write, Edit
---

# Ghostty Terminal Setup

Set up a complete Ghostty terminal environment on a fresh Mac. Requires Homebrew to be installed first.

## Instructions

Run the setup script:

```bash
bash ~/ghostty-setup/setup.sh
```

After the script finishes:

1. Verify there were no errors in the output
2. Remind the user to **restart Ghostty completely** (quit and reopen)
3. Tell them about the key shortcuts:
   - `Ctrl+\`` — quick terminal from anywhere
   - `Cmd+D` / `Cmd+Shift+D` — split right / split down
   - `Cmd+Option+Arrows` — navigate splits
   - `Cmd+Shift+Enter` — zoom/unzoom split
   - `Ctrl+R` — fuzzy search history (fzf)
   - `Option+C` — fuzzy cd (fzf)
   - `z <name>` — smart cd (zoxide)
   - `Option+Click` — move cursor on command line
   - `Option+Enter` — newline without executing
4. Tell them about the installed tools:
   - `lazygit` — terminal git UI
   - `yazi` — terminal file manager
   - `btop` — system monitor
   - `dust` — disk usage
   - `rg "term"` — fast code search (ripgrep)
   - `ls` / `ll` / `lt` — eza with icons
   - `cat` — bat with syntax highlighting
5. Note: the starship config disables AWS, gcloud, kubernetes, docker, golang, nodejs, package, status, and git_status modules. They can re-enable any in `~/.config/starship.toml`
6. Note: git-delta is configured for side-by-side diffs. Works automatically in `git diff` and lazygit.

7. Note: Claudeception is installed — it auto-saves non-obvious discoveries as reusable skills. Trigger manually with `/claudeception`.

If something fails, troubleshoot it. The most common issue is Homebrew not being installed.
