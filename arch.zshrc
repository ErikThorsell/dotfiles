# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=SAVEHIST=99999
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select

autoload -U compinit
compinit

# Exports
export PATH=$PATH:$HOME/Pkg/:$HOME/Pkg/nvidia-utils-beta:$HOME/Pkg/Telegram:opt/local/bin:/sbin:/usr/local/lib:$HOME/.gem/ruby/2.2.0/bin:/usr/lib

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Enable colors
autoload -U colors
colors

# Cooler prompt
autoload -U promptinit
promptinit

# Configure prompt
PROMPT="%{$fg_bold[blue]%}%n%{$fg[magenta]%}@%{$fg_no_bold[cyan]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}>%"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Functions
# Make directory and cd into it.
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

bindkey "^[[3~" delete-char

## Aliases
# Common
alias ..="cd .."
alias cdsi="cd ~/Storage/Dropbox/Chalmers/Supplemental\ Instructions/SI-Pass/Matematisk\ Analys"
alias cdcte="cd /home/glader/Storage/OwnCloud/Chalmers/CTE031/report"
alias clr="clear"
alias clrerl="rm *.beam"
alias clrj="rm *.class"
alias clrtex="rm *.aux *.log"
alias clrtexz="rm *.aux *.log *.synctex.gz"
alias la="ls -al"
alias ll="ls -l"
alias ls="ls --color=auto"
alias lsa="ls -al"
alias lsl="ls -l"
alias mv="mv -i"
alias open="xdg-open"
alias s="sudo"

# Git
alias gca="git commit -a"
alias gl="git log"
alias gpm="git push -u origin master"
alias gpr="git pull --rebase"
alias gs="git status"

# Programs
alias matrix="cmatrix -b"
alias train="sl -ac"
alias ttytter="ttytter -ssl -dostream -readline -ansi -newline -exts=/home/glader/.ttytter/oxhak_ttytter_output.pl"
alias xcc="xclip -selection clipboard"
alias ytdl="youtube-dl --prefer-free-formats"
alias ytdlm="youtube-dl -x"
alias ytdlmp="youtube-dl -x --yes-playlist"

# System
alias mountbackup="sudo mount.nfs 192.168.0.89:/mnt/volume1/backup ~/Backup"
alias pms="sudo pm-suspend"
alias shn="sudo shutdown -h now"
alias spy="sudo pacman -Syu"

# Start archey
# archey3
