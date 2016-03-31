# Path to your oh-my-zsh installation.
  export ZSH=/home/erik/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

###############################################################################
## User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export BROWSER="/usr/bin/firefox"
export LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1' steam

# Set environment variables
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
alias clr="clear"
alias clrerl="rm *.beam"
alias clrj="rm *.class"
alias clrtex="rm *.aux *.log"
alias clrtexz="rm *.aux *.log *.synctex.gz"
alias la="ls -al"
alias ll="ls -l"
alias ls="ls --color=auto"
alias lsa="ls -alh"
alias lsl="ls -lh"
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
alias ttytter="ttytter -ssl -dostream -readline -ansi -newline -exts=/home/erik/.ttytter/oxhak_ttytter_output.pl"
alias xcc="xclip -selection clipboard"
alias ytdl="youtube-dl --prefer-free-formats"
alias ytdlm="youtube-dl -x"
alias ytdlmp="youtube-dl -x --yes-playlist"

# System
alias cppath="pwd|xclip -selection clipboard"
alias mountbackup="sudo rpcbind && sudo mount.nfs 192.168.0.89:/mnt/volume1/backup ~/Backup"
alias mountmedia="sudo mount.nfs 192.168.0.89:/mnt/volume1/media /home/erik/Media"
alias pms="sudo pm-suspend"
alias shn="sudo shutdown -h now"
alias spy="sudo pacman -Syu"

# Temporary
alias jdot="java Main >> /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.dot && dot -Tpng /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.dot -o /home/erik/Programming/git/school/ENM155_Modelling_ESystems/graphs/graph.png"
