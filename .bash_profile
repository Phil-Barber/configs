# kubernetes aliases
source ~/.bash_kube

export PS1="\A [\$(get_context)|\$(get_namespace)] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PATH=/usr/local/Cellar:$PATH
export DEPLOY_TO=$(get_namespace)
export LC_COLLATE=C
export BASH_SILENCE_DEPRECATION_WARNING=1



export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'

# [Aliases]
alias python=python3
alias ls='ls -lG'
alias pip=pip3
alias restart-nginx='sudo nginx -s stop && sudo nginx'
alias g='git'
alias dc='docker-compose'
eval $(thefuck --alias f)
alias sentry-cli='sentry-cli --api-key $SENTRY_API_KEY'
alias stern='stern --color=always'
alias ctags="`brew --prefix`/bin/ctags"
alias t="todo.sh"


function parent {
    (cd .. && $*)
}

function manage {
    service=$1
    shift
    docker-compose run "$service" python manage.py "$@"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


function make_py_tags {
    find . -name '*.py' > cscope.files
    cscope -Rb
    ctags -R .
}
function make_js_tags {
    find . -name '*.js' > cscope.files
    cscope -Rb
    ctags -R .
}
