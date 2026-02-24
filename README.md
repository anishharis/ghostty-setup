# Ghostty Terminal Setup

Full terminal setup for macOS with Ghostty, shell plugins, and CLI tools.

## What's Included

**Terminal:** Ghostty with Catppuccin theme, blur, padding, quick terminal

**Font:** JetBrains Mono Nerd Font

**Shell Plugins:**
- zsh-autosuggestions — inline history suggestions
- zsh-autocomplete — dropdown tab completions
- zsh-syntax-highlighting — colors commands as you type
- zsh-you-should-use — reminds you about aliases

**Prompt:** Starship with Nerd Font Symbols preset

**Tools:**
- lazygit — terminal git UI
- yazi — terminal file manager
- eza — modern ls with icons
- bat — modern cat with syntax highlighting
- fzf — fuzzy finder
- zoxide — smart cd
- btop — system monitor
- dust — disk usage
- ripgrep — fast code search
- git-delta — better git diffs

## Quick Install

Requires [Homebrew](https://brew.sh) first.

```bash
git clone https://github.com/anishharis/ghostty-setup.git
cd ghostty-setup
bash setup.sh
```

Then restart Ghostty.

## Config Files

| File | Description | Destination |
|------|-------------|-------------|
| `setup.sh` | Install script | Run once |
| `ghostty.config` | Ghostty config | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| `starship.toml` | Starship prompt config | `~/.config/starship.toml` |

## Claude Code Skill

To install as a Claude Code slash command:

```bash
mkdir -p ~/.claude/skills/ghostty-setup
cp claude-skill/SKILL.md ~/.claude/skills/ghostty-setup/SKILL.md
```

Then type `/ghostty-setup` in Claude Code to run it. The skill references `~/ghostty-setup/setup.sh`, so clone this repo to your home directory.

## Key Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl + \`` | Quick terminal (from anywhere) |
| `Cmd + D` | Split right |
| `Cmd + Shift + D` | Split down |
| `Cmd + Option + Arrows` | Navigate splits |
| `Cmd + Shift + Enter` | Zoom/unzoom split |
| `Ctrl + R` | Fuzzy search history |
| `Option + C` | Fuzzy cd |
| `z <name>` | Smart cd |
| `Option + Click` | Move cursor on command line |
| `Option + Enter` | Newline without execute |
