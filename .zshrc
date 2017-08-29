export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code/

export PATH="$PATH:/usr/local/bin"
export PATH="/Users/helsinki/homebrew/bin:$PATH"

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# source /usr/local/bin/virtualenvwrapper.sh

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Add GOPATH to PATH
export GOPATH=$HOME/code/go
export PATH="$PATH:$GOPATH/bin"

# enable rbenv
eval "$(rbenv init -)"

# enable nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# awscm
awscm() {
    tmpfile=$(mktemp)
    /Users/helsinki/homebrew/bin/awscm --file "$tmpfile" "$@"
    . "$tmpfile"
    rm "$tmpfile"
}

# Enable git completion (maybe this enables autocompletion generally?)
autoload -Uz compinit && compinit

# zsh completion
fpath=(/Users/helsinki/homebrew/share/zsh-completions $fpath)

# sloc
alias sloc='~/.config/yarn/global/node_modules/sloc/bin/sloc'

# azure-cli
alias az="/Users/helsinki/bin/az"

# Display which git branch you're in
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Prompt settings
# %n displays machine name
# : colon separator
# %. displays the trailing component of the current working dir
# %% displays a percentage sign
PROMPT='%n:%. %% '

# Git aliases:
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push && git push --tag"

# Enable ipython command globally
alias ipython="python -m IPython"

# Enable code command
# alias code="/usr/local/bin/code"
#
# alias ccat
alias cat="ccat"

# quickly edit ssh config
alias sconf="vim ~/.ssh/config"

# move file/dir to Trash
function trash () {
    mv -v -i $1 ~/.Trash/
}

# make a temp directory and 'cd' to it

function tmp () {
    tmpdir="$(mktemp -d)"
    cd $tmpdir
}

# Serve go documentation
function gwd () {
    echo "Listening on localhost:5001"
    godoc -http :5001 &
    python -c "import webbrowser; webbrowser.open('http://localhost:5001')"
    echo "Kill server with:"
    echo "kill" $!
}

# source ~/code/dev/dev.sh

# Arrow-key autocomplete selection
zstyle ':completion:*' menu select

# Add ls options. all, long, human-readable, slashes after directories
alias ll='ls -hlGFA'

# Scheme REPL
alias scheme='racket -l sicp --repl'

# Easily edit and source zshrc
alias zshrc="vim ~/.zshrc && source ~/.zshrc"

# Coloured ls output
export CLICOLOR=1

# Coloured grep output
alias grep='grep --color=auto'

# Git Ignore Generator
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Enable zsh syntax highlighting. Note this must be the last entry.
source /Users/helsinki/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


