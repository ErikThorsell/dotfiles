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
export PATH=$PATH:$HOME/Pkg/nvidia-utils-beta:$HOME/Pkg/Telegram:$HOME/Pkg/gcc-arm-none-eabi-4_8-2014q2/bin:$HOME/Pkg/DrMemory-MacOS-1.8.0-8/bin:$HOME/Pkg/Spin/Src6.4.3/:opt/local/bin:/sbin

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
PROMPT="%{$fg_bold[white]%}%n%{$fg[magenta]%}@%{$fg_no_bold[cyan]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}>%"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Aliases
# General
alias s="sudo"
alias ..="cd .."
alias la="ls -al"
alias ll="ls -l"
alias ls="ls --color=auto"
alias lsl="ls -l"
alias lsa="ls -al"
alias clr="clear"
<<<<<<< HEAD
alias tat="tmux attach -t"
alias tls="tmux list-sessions"
alias mkdir="mkdir -p"
alias tree="tree -C"
alias se="sudoedit"
alias so="source"
alias qq="exit"
=======
alias clrtex="rm *.aux *.log"
alias clrtexz="rm *.aux *.log *.synctex.gz"
alias clrj="rm *.class"
alias clrerl="rm *.beam"
alias cdsi="cd ~/Storage/Dropbox/Chalmers/Supplemental\ Instructions/SI-Pass/Matematisk\ Analys"
alias mv="mv -i"
>>>>>>> Cleaning: Started cleaning process.

# Git
alias gpr="git pull --rebase"
alias gca="git commit -a"
alias gpm="git push -u origin master"
alias gs="git status"
alias gl="git log"

# System
alias pms="sudo pm-suspend"
alias shn="sudo shutdown -h now"
alias matrix="cmatrix -b"
alias ytdl="youtube-dl --max-quality FORMAT"
alias train="sl -ac"

# Start archey
# archey3
