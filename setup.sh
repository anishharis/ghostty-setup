#!/bin/bash
# ===========================================
# Ghostty Terminal Setup - Full Replication
# ===========================================
# Run this script on a fresh Mac to replicate
# the full terminal setup. Requires Homebrew.
# Install Homebrew first: https://brew.sh
#
# Usage: bash ghostty-setup.sh
# ===========================================

set -e

echo "=== Installing Ghostty ==="
brew install --cask ghostty

echo "=== Installing Nerd Font ==="
brew install --cask font-jetbrains-mono-nerd-font

echo "=== Installing shell plugins ==="
brew install zsh-autosuggestions
brew install zsh-autocomplete
brew install zsh-syntax-highlighting
brew install zsh-you-should-use

echo "=== Installing prompt ==="
brew install starship

echo "=== Installing tools ==="
brew install fzf
brew install zoxide
brew install lazygit
brew install yazi
brew install eza
brew install bat
brew install btop
brew install dust
brew install ripgrep
brew install git-delta

echo "=== Configuring Starship (Nerd Font preset) ==="
mkdir -p ~/.config
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Disable noisy modules in starship
python3 << 'PYEOF'
with open('/tmp/starship-disabled.toml', 'w') as f:
    f.write("""
[aws]
disabled = true

[azure]
disabled = true

[gcloud]
disabled = true

[kubernetes]
disabled = true

[docker_context]
disabled = true

[golang]
disabled = true

[nodejs]
disabled = true

[package]
disabled = true

[status]
disabled = true

[git_status]
disabled = true
""")
PYEOF
cat /tmp/starship-disabled.toml >> ~/.config/starship.toml

echo "=== Configuring git-delta ==="
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default

echo "=== Writing Ghostty config ==="
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
cat > "$HOME/Library/Application Support/com.mitchellh.ghostty/config" << 'EOF'
# Font
font-family = JetBrainsMono Nerd Font

# Theme — auto switches with macOS light/dark mode
theme = light:Catppuccin Latte,dark:Catppuccin Mocha

# Window
background-opacity = 0.9
background-blur-radius = 20
window-padding-x = 10
window-padding-y = 8

# Mouse
mouse-hide-while-typing = true

# Quick terminal (Ctrl+` from anywhere)
quick-terminal-position = top
quick-terminal-animation-duration = 0.15
keybind = global:ctrl+grave_accent=toggle_quick_terminal

# Shell integration
shell-integration-features = cursor,sudo,title
EOF

echo "=== Adding shell plugins to .zshrc ==="
# Only add if not already present
add_to_zshrc() {
    if ! grep -q "$1" ~/.zshrc 2>/dev/null; then
        echo "$2" >> ~/.zshrc
    fi
}

add_to_zshrc "zsh-autocomplete" '
# zsh-autocomplete (must be near top — move this line manually if needed)
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh'

add_to_zshrc "zsh-autosuggestions" '
# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

add_to_zshrc "zsh-you-should-use" '
# zsh-you-should-use
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh'

add_to_zshrc "zoxide init" '
# zoxide (smart cd)
eval "$(zoxide init zsh)"'

add_to_zshrc "starship init" '
# Starship prompt
eval "$(starship init zsh)"'

add_to_zshrc "eza --icons" '
# Modern replacements
alias ls="eza --icons"
alias ll="eza --icons -la"
alias lt="eza --icons --tree --level=2"
alias cat="bat"'

add_to_zshrc "zsh-syntax-highlighting" '
# zsh-syntax-highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

echo "=== Installing Claude Code skills ==="
mkdir -p ~/.claude/skills
git clone https://github.com/blader/Claudeception.git ~/.claude/skills/claudeception 2>/dev/null || echo "Claudeception already installed"

echo ""
echo "=== Done! ==="
echo "Restart Ghostty and open a new shell."
echo ""
echo "Installed tools:"
echo "  lazygit  — terminal git UI"
echo "  yazi     — terminal file manager"
echo "  eza      — modern ls"
echo "  bat      — modern cat"
echo "  fzf      — fuzzy finder (Ctrl+R for history)"
echo "  zoxide   — smart cd (z <name>)"
echo "  btop     — system monitor"
echo "  dust     — disk usage"
echo "  ripgrep  — fast code search (rg)"
echo "  delta    — better git diffs"
