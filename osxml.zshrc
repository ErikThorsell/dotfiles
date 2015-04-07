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
export PATH=$PATH:/Users/glader/Library/PlayOnMac/wineprefix/Packet_Tracer_/drive_c/Program\ Files/Cisco\ Packet\ Tracer\ 6.2sv/bin:$HOME/Pkg/Spin/Src6.4.3/:$HOME/pkg/gcc-arm-none-eabi-4_8-2014q2/bin:$HOME/pkg/DrMemory-MacOS-1.8.0-8/bin:/opt/local/bin

# Enable colors
autoload -U colors
colors

# Cooler prompt
autoload -U promptinit
promptinit

# Configure prompt
PROMPT="%{$fg_bold[white]%}%n%{$fg[magenta]%}@%{$fg_no_bold[cyan]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}>%"

## Aliases

# Common
alias s="sudo"
alias ..="cd .."
alias mf="make flash"
alias ls="ls -G"
alias lsl="ls -l"
alias lsa="ls -al"

# Cleaning
alias clr="clear"
alias clrtex="rm *.aux *.log"
alias clrtexz="rm *.aux *.log *.gz"
alias clrj="rm *.class"
alias clrerl="rm *.beam"

# Git
alias gpr="git pull --rebase"
alias gca="git commit -a"
alias gpm="git push -u origin master"
alias gs="git status"
alias gl="git log"

# Specials
alias cdsi="cd ~/Dropbox/Chalmers/Supplemental\ Instructions/SI-Pass/Matematisk\ Analys/"
alias ytdl="youtube-dl --max-quality FORMAT"
alias mountfreenas="mount_nfs 192.168.0.89:/mnt/volume1/media /Users/glader/freenas-media"
