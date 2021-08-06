# FB-specific dotfiles
if test -f ".zshrc.fb"; then
    source .zshrc.fb
else
    echo "FB file does not exist"
fi

export ZSH=/home/blin/.oh-my-zsh
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true

# ZSH_THEME="spaceship"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-256color zsh-syntax-highlighting encode64 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

alias esq='ln -s ~/dot/latex/esqu1.sty'
#alias ls='exa'
#alias ll='exa -lh'
alias vim='nvim'
export VISUAL=nvim
export EDITOR="$VISUAL"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
fpath+=${ZDOTDIR:-~}/.zsh_functions

export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

export TVM_HOME=$HOME/Documents/tvm
export PYTHONPATH=$TVM_HOME/python:${PYTHONPATH}

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
