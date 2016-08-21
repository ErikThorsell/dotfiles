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

## Exports

# Path
export PATH=$PATH:$HOME/Programming/git/school/DATX02_BsC_Thesis/ignored/upos/bin:$HOME/.cabal/bin:$HOME/Pkg/nvidia-utils-beta:$HOME/Pkg/Telegram:opt/local/bin:/sbin:/usr/local/lib:$HOME/.gem/ruby/2.2.0/bin:/opt/intel/bin

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
source /home/erik/Programming/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias cdcte="cd /home/erik/ownCloud/Chalmers/CTE031/report"
alias cdkan="cd /home/erik/Programming/git/school/DATX02_BsC_Thesis"
alias clr="clear"
alias clrerl="rm *.beam"
alias clrj="rm *.class"
alias clrtex="rm *.aux *.log"
alias clrtexz="rm *.aux *.log *.synctex.gz"
alias la="ls -hal"
alias ll="ls -hl"
alias ls="ls -h --color=auto"
alias lsa="ls -hal"
alias lsl="ls -hl"
alias mv="mv -i"
alias open="xdg-open"
alias s="sudo"

# Programs
alias newbg="feh --randomize --bg-scale /home/erik/Pictures/bgrounds/*"
alias matrix="cmatrix -b"
alias train="sl -ac"
alias ttytter="ttytter -ssl -dostream -readline -ansi -newline -exts=/home/erik/.ttytter/oxhak_ttytter_output.pl"
alias xcc="xclip -selection clipboard"
alias xpw="pwd|xclip -selection clipboard"
alias ytdl="youtube-dl --prefer-free-formats"
alias ytdlm="youtube-dl -x"
alias ytdlmp="youtube-dl -x --yes-playlist"
alias quote="clear && fortune -a | cowsay -f tux"
alias pdfpres="qpdfpresenterconsole"
alias telegram="telegram-cli -N -l 1"

# System
alias lock="i3lock-fancy -p"
alias mountbackup="sudo rpcbind && sudo mount.nfs 192.168.0.89:/mnt/volume1/backup ~/Backup"
alias mountmedia="sudo mount.nfs 192.168.0.89:/mnt/volume1/media /home/erik/Media"
alias pms="sudo pm-suspend"
alias shn="sudo shutdown -h now"
alias spy="sudo pacman -Syu"
alias bground="feh --randomize --bg-scale /home/erik/Pictures/bgrounds/*&"

# Temporary
alias jdot="java Main >> /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.dot && dot -Tpng /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.dot -o /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.png"
