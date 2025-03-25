# Aliases
alias home="cd ~/"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias downl="cd ~/Downloads"
alias musi="cd ~/Music"
alias pict="cd ~/Pictures"
alias vide="cd ~/Videos"

alias upd_dot="sh ~/.scripts/update_dotfiles.sh"

# Terminal Prompts
pyfiglet -s -f small_slant $(fastfetch -s os --format json | jq -r '.[0].result.name') | lolcat && echo && fastfetch -l none
eval "$(starship init zsh)"

# ZSH plugins
source "$HOME/.antigen/antigen.zsh"

antigen use belak/zsh-utils --branch=main
antigen bundle zsh-users/zsh-completions
antigen bundle editor@main
antigen bundle history@main
# antigen bundle prompt@main  # Uncomment this line if you don't want starship prompt
antigen bundle utility@main
antigen bundle completion@main
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

bindkey -e
