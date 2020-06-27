echo "\n"
neofetch


# Path to your oh-my-zsh installation.
export ZSH=/home/blin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-256color zsh-syntax-highlighting encode64 zsh-autosuggestions)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#TMOUT=1

#TRAPALRM() {
#    zle reset-prompt
#}
bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

function proxy_on() {
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.socks enabled true
    gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
    gsettings set org.gnome.system.proxy.socks port 24
    echo d9ab1b && ssh -D 24 -fN shell2014.picoctf.com -l pico14113
}

function proxy_off() {
    killall ssh
    gsettings set org.gnome.system.proxy.socks enabled false
    gsettings set org.gnome.system.proxy mode 'none'
}

#alias emacs='vi'
#alias nano='vi'
#alias cd='sudo shutdown -P now'
#alias ls='kill `ps auxww | awk '{print $2}' | while read line ; do echo "$RANDOM $line"; done | sort | cut -d ' ' -f 2 | head -n 1`'

alias esq='ln -s ~/dot/latex/esqu1.sty'
alias ls='exa'
alias ll='exa -lh'
alias vim='nvim'
export VISUAL=nvim
export EDITOR="$VISUAL"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
fpath+=${ZDOTDIR:-~}/.zsh_functions

export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

# opam configuration
test -r /home/blin/.opam/opam-init/init.zsh && . /home/blin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

