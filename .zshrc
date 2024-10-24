# Environment Variables

# Startup commands
fastfetch
eval "$(starship init zsh)"

# Aliases
alias sudo="nocorrect sudo"
alias vim="nvim"
alias qtile-conf="nvim ~/.config/qtile/config.py"
alias nix-conf="sudo nvim /etc/nixos/configuration.nix"
alias dotfiles-update="sh ~/.scripts/update_dotfiles.sh"

# Add binaries to PATH
export PATH="$HOME/.config/emacs/bin:$PATH"
