export LC_CTYPE=en_US.UTF-8
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=~/bin:$PATH
alias ll='ls -lh'
alias gu='git pull --rebase'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gba='git branch | grep "*"'
alias gs='git status'
alias phpdbg='XDEBUG_CONFIG= php'

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
