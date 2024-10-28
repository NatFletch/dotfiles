# Environment Variables

# Startup commands
fastfetch
eval "$(starship init zsh)"

# Aliases
alias sudo="nocorrect sudo"
alias vim="nvim"
alias sys-update="sudo apt update && sudo apt upgrade -y"
alias qtile-conf="nvim ~/.config/qtile/config.py"
alias nix-conf="sudo nvim /etc/nixos/configuration.nix"
alias dotfiles-update="sh ~/.scripts/update_dotfiles.sh"

# Add binaries to PATH
export PATH="$HOME/.config/emacs/bin:$PATH"
