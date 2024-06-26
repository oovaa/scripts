# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u-\033[00m\]\[\033[01;34m\]\w\[\033[00m\] → '
else
    PS1='${debian_chroot:+($debian_chroot)}\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='rg --line-number --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#ma aliases
alias update='sudo nala update && list'
alias upgrade='sudo nala upgrade'
alias list='apt list --upgradable'
alias fuck='thefuck'
alias lsd='ls -d */'
alias v='vim'
alias stz='exec zsh'
#alias rm='trash'
alias bcat='batcat'
alias pcs='find . -type f -name "*.py" -exec pycodestyle {} +;'
alias ls='exa'
alias shc='shellcheck'
# alias py="python3"

# Aliases for commonly used commands
alias ll='ls -alf'
alias la='ls -a'
alias l='ls -cf'
alias ..='cd ..'
alias grep='grep --color=auto'
alias rsaloc='~/.ssh/id_rsa'
alias web1='ssh -i ~/.ssh/id_rsa  ubuntu@54.165.78.43'
alias web2='ssh -i ~/.ssh/id_rsa  ubuntu@54.84.65.46'
alias lb='ssh -i ~/.ssh/id_rsa  ubuntu@54.160.99.228'
alias penv="source venv/bin/activate"
alias wifi="wifi toggle"
alias install="sudo nala install"

# git status - Show the current status of the repository
alias gs='git status'
# git add - Add changes to the staging area
alias ga='git add'
# git commit - Commit changes to the repository
alias gc='git commit'
# git push - Push committed changes to a remote repository
alias gp='git push'
# git pull - Fetch and merge changes from a remote repository
alias gpl='git pull --rebase'
# git branch - List, create, or delete branches
alias gb='git branch'
# git checkout - Switch branches or restore working tree files
alias gco='git checkout'
# git checkout -b - Create and switch to a new branch
alias gcb='git checkout -b'
# git switch - Switch branches
alias gs='git switch'
# git switch -c - Create and switch to a new branch
alias gsn='git switch -c'
# git branch -d - Delete a specified branch
alias gbd='git branch -d'
# git reset --hard - Reset the current HEAD to a specified state, discarding changes
alias grh='git reset --hard'
# git reset --soft - Reset the current HEAD to a specified state, keeping changes in the working directory and staging area
alias grs='git reset --soft'
# git log - Show commit logs
alias gl='git log'
# git log --pretty=format - Show a custom formatted commit log
alias glog='git log --graph --oneline --decorate'
# git diff - Show changes between commits, commit and working tree, etc.
alias gd='git diff'
# git diff --cached - Show changes between the index (staging area) and the HEAD
alias gdc='git diff --cached'
# git status - Show the current status of the repository
alias gss='git status --short'           # Short and concise status
alias gsl='git status --long'            # Detailed status with full file paths
alias gsu='git status --untracked-files' # Show untracked files
alias gsi='git status --ignored'         # Show ignored files
alias gf='git fetch'                     # Show ignored files

# Custom functions
extract() {
    if [ -f "$1" ]; then
        case $1 in
        *.tar.bz2) tar xvjf "$1" ;;
        *.tar.gz) tar xvzf "$1" ;;
        *.tar.xz) tar xvJf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xvf "$1" ;;
        *.tbz2) tar xvjf "$1" ;;
        *.tgz) tar xvzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "Unknown archive format" ;;
        esac
    else
        echo "File does not exist"
    fi
}

# Enable colorized output for some commands
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$PATH:~/.local/bin
