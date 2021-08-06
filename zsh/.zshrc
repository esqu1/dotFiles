echo "\n"
neofetch

export ZSH=/home/blin/.oh-my-zsh
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true

ZSH_THEME="spaceship"

plugins=(git zsh-256color zsh-syntax-highlighting encode64 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

alias esq='ln -s ~/dot/latex/esqu1.sty'
alias ls='exa'
alias ll='exa -lh'
alias vim='nvim'
alias asdf="setxkbmap dvorak"
alias aoeu="setxkbmap en_US"
export VISUAL=nvim
export EDITOR="$VISUAL"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
fpath+=${ZDOTDIR:-~}/.zsh_functions

export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

export TVM_HOME=$HOME/Documents/tvm
export PYTHONPATH=$TVM_HOME/python:${PYTHONPATH}

# opam configuration
test -r /home/blin/.opam/opam-init/init.zsh && . /home/blin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


PATH="/home/blin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/blin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/blin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/blin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/blin/perl5"; export PERL_MM_OPT;

eval "$(starship init zsh)"
