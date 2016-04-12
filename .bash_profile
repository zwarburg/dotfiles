export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

source ~/src/dotfiles/scripts/rake_autocomplete.bash
source ~/src/dotfiles/bash/color.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=TextEdit

# Colors
# \e[XX;YYm]
# XX = foreground color
# YY = background color, but really text styling
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# \[\e[0;96m\]\w  --> full working directory
# \[\e[0;32m\]\u  --> current username

# branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

PS1="\[\e[0;96m\]\w \[\e[0;32m\]\u\[\e[0;91m\]\$(parse_git_branch_and_add_brackets) \[\e[0m\]$ "

function parse_git_branch_and_add_brackets
{
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

#Bash basics
alias finder="open ."
alias back="cd -"
alias clr="clear"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias cdd="cd ../"
alias c="clear"
alias reload="source ~/.bash_profile"
alias prompt="mate ~/.bash_profile"
alias prompt2="mate /etc/motd"
alias mlb="ssh -D 8080 -C -N "

#CD
alias dot='cd ~/src/dotfiles'
alias v='cd /Volumes'
alias s='cd /Volumes/Source'
alias rs3='cd /Volumes/Source/rs3'
alias rs='cd /Volumes/Source/rs'
alias rsem='cd /Volumes/Source/ember-rs'
alias guides='cd /Volumes/Source/guides'
#alias gems='cd ~/src/gems'

#Rake
alias be="bundle exec"
alias brake="bundle exec rake"
alias solr="brake solr:reindex"
alias migrate="brake db:migrate; brake db:migrate RAILS_ENV=test"
alias up="git pull; bundle install; migrate; say 'migrating like a boss';"
alias resetdb="brake db:migrate:reset RAILS_ENV=test; brake db:migrate:reset"

#start/restart/clean shit up
alias sel="print_red 'KILLING SELENIUM';launchctl stop homebrew.mxcl.selenium-server-standalone;sleep 3;print_blue 'STARTING SELENIUM';launchctl start homebrew.mxcl.selenium-server-standalone"
alias mem="print_red 'KILLING MEMCACHE';launchctl stop homebrew.mxcl.memcached; sleep 2;print_blue 'STARTING MEMCACHE';launchctl start homebrew.mxcl.memcached"
alias dynamo='bundle exec fake_dynamo --port 4567'
alias sphinx='rake ts:rebuild'
alias lion='rake ts:rebuild'
alias pg='rm /usr/local/var/postgres/postmaster.pid; pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
ss () {
    if [[ -f Procfile ]]
    then
        bundle exec foreman start
    elif [[ -f ember-cli-build.js ]]
    then
        ember server
    fi
}

#misc

#RS4
alias jcop="jscs app"
alias cop="rubocop --auto-correct"
alias es="rake es:reindex"
alias dmigrate='bundle exec rake ddb:create CLASS=Audit RAILS_ENV=test;bundle exec rake ddb:create CLASS=Audit'
upember (){
	(rsem && git co master && git pull && npm install && bower install)
}
alias upem='upember'
alias cleanem='rm -rf node_modules && rm -rf bower_components'

#git
alias promptgit="mate ~/dotfiles/.gitconfig"
alias st="git status;echo '########################## GIT STASH ##########################';git stash list;"
alias gst="st"
alias glog="git l"
alias prune="git remote prune origin"
alias push="git push origin \$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')"
alias rebase="git rebase develop"
alias pull="git pull; prune"
alias squash="sq"
alias b="git b"
alias stash="git stash"
alias pop="git stash pop"
alias oops="git reset --soft HEAD^;echo 'Previous commit undone...';st"
function sq()
{
	git rebase -i HEAD~"$*"
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

function stopmail()
{
	x=`lsof -Fp -i:1025`
 	kill -9 ${x##p}
}
#functions
mp()
{
	man -t $@ | open -f -a /Applications/Preview.app ;
}
function nuke (){
	spring stopmail
	pkill passenger
	killall -9 ruby
}

function tabname {
  printf "\e]1;$1\a"
}

export PATH="$HOME/.rbenv/bin:$PATH"
export STUB_STEWARD="Stub me bitches!"
eval "$(rbenv init -)"
