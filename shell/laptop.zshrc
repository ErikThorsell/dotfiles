zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(class|out|aux|log|pdf|bbl|blg|bib|xml|run):source-files' '*:all-files'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/erik/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch notify
unsetopt autocd beep extendedglob
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install

## Exports
export BROWSER=/usr/bin/firefox

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
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Functions

# Use VIM as manpage reader
man() {
    PAGER="/bin/sh -c \"col -b | vim -R -c 'set ft=man' -\"" command man $@
}

# Make directory and cd into it.
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# Make simple calculations
calc() {
    python -c "print($1)"
}

wcpdf() {
    pdftotext "$1" - | wc
}

bindkey "^[[3~" delete-char

## Aliases
# Common
alias ..="cd .."
alias cdnevs="cd /home/erik/ownCloud/NEVS"
alias clc="clear"
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
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias livestreamer="livestreamer --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6"
alias nvimrc="nvim ~/git/dotfiles/config/nvim/config/"

# System
alias lock="i3lock-fancy -p"
alias pms="systemctl suspend"
alias shn="dumount && dxoff && sudo shutdown -h now"
alias bground="feh --bg-scale /home/erik/Pictures/bgrounds/low_polygon4.jpg&"
alias battery="sudo powertop --auto-tune"
alias qq="exit"

# Docking
alias dmount="sudo mount 192.168.1.111:/mnt/volume1/media /home/erik/media"
alias dumount="sudo umount /home/erik/media"
alias dxon="xrandr --output DP2-1 --mode 2560x1440 --pos 1920x-720 --rotate normal"
alias dxoff="xrandr --output DP2-1 --off"
alias dock="dmount && dxon && source ~/.xprofile"
alias undock="dumount && dxoff"

# Temporary
