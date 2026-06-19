# --------------------------------------------------
# BETTER PROMPT RESPONSIVENESS
# --------------------------------------------------

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# --------------------------------------------------
# OH MY ZSH
# --------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------
# PATHS
# --------------------------------------------------

export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.npm-global/bin:$PATH"

# --------------------------------------------------
# NVM
# --------------------------------------------------

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# --------------------------------------------------
# STARTUP BANNER
# --------------------------------------------------

pokemonfetch() {
    pokemon-colorscripts --no-title -s -r > /tmp/pokemon_logo

    fastfetch \
        --pipe false \
        --config ~/.config/fastfetch/config.jsonc \
        --logo-type file \
        --logo /tmp/pokemon_logo
}

if [[ $- == *i* ]]; then
    pokemonfetch
fi

# --------------------------------------------------
# CLEAR COMMAND WITH REFETCH
# --------------------------------------------------

clear() {
    command clear
    pokemonfetch
}

# --------------------------------------------------
# EZA (RECOMMENDED)
# --------------------------------------------------

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --git --git-ignore --group-directories-first --time-style=long-iso'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=3 --all --icons'

# --------------------------------------------------
# BASIC SHORTCUTS
# --------------------------------------------------

alias c='clear'
alias e='exit'
alias s='sudo'
alias zrc='nano ~/.zshrc'
alias update='sudo apt update && sudo apt upgrade -y'
alias remove='sudo apt autoremove -y'
alias i='sudo apt install'

# --------------------------------------------------
# NAVIGATION
# --------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'

# --------------------------------------------------
# GIT
# --------------------------------------------------

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'

alias gl="git log --graph --topo-order --pretty='%w(100,2,6)%C(yellow)%h%C(reset) %C(blue)%ad%C(reset) %C(green)%s%C(reset) %C(magenta)%an%C(reset)%C(cyan)%d%C(reset)' --date=format:'%Y-%m-%d %H:%M:%S'"

# --------------------------------------------------
# DOCKER
# --------------------------------------------------

alias d='docker'

alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias di='docker images'
alias dtail='docker logs -f'

alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'

# --------------------------------------------------
# KUBERNETES
# --------------------------------------------------

alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kdesc='kubectl describe'
alias klogs='kubectl logs -f'
alias bat=batcat
