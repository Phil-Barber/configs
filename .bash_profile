export PS1="\A \$(__kube_ps1) \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PATH=/usr/local/Cellar:$PATH


export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'

# [Aliases]
alias python=python3
alias ls='ls -lG'
alias pip=pip3
alias restart-nginx='sudo nginx -s stop && sudo nginx'
alias g='git'
alias dc='docker-compose'
eval $(thefuck --alias)
alias sentry-cli='sentry-cli --api-key $SENTRY_API_KEY'

# kubernetes aliases
source ~/.bash_kube


function parent {
    (cd .. && $*)
}

function manage {
    service=$1
    shift
    docker-compose run "$service" python manage.py "$@"
}
