# Aliases
alias home="cd ~/"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias downl="cd ~/Downloads"
alias musi="cd ~/Music"
alias pict="cd ~/Pictures"
alias vide="cd ~/Videos"

alias update='paru -Syyu --noconfirm && flatpak update -y'
alias upd_dot="sh ~/.scripts/update_dotfiles.sh"

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo ''$1' cannot be extracted via ex()' ;;
    esac
  else
    echo ''$1' is not a valid file'
  fi
}


# Terminal Prompts
pyfiglet -s -f small_slant $(fastfetch -s os --format json | jq -r '.[0].result.name') | lolcat && echo && fastfetch -l none

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autosuggestions
 )


ZSH_THEME=gozilla

source /home/nathan/.oh-my-zsh/oh-my-zsh.sh
