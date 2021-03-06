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
alias guides='cd /Volumes/Source/guides'
#alias gems='cd ~/src/gems'

# for repo in $(ls ~/src/gems)
# do
# 	alias $repo="cd ~/src/gems/$repo"
# done

#Rake
alias be="bundle exec"
alias brake="bundle exec rake"
alias solr="brake solr:reindex"
alias migrate="brake db:migrate; brake db:migrate RAILS_ENV=test"
alias up="git pull; bundle install; migrate; say 'migrating like a boss';"
alias resetdb="brake db:migrate:reset RAILS_ENV=test; brake db:fixtures:load  RAILS_ENV=test; brake db:migrate:reset; brake db:fixtures:load"

#start/restart/clean shit up
alias sel="print_red 'KILLING SELENIUM';launchctl stop homebrew.mxcl.selenium-server-standalone;sleep 3;print_blue 'STARTING SELENIUM';launchctl start homebrew.mxcl.selenium-server-standalone"
alias mem="print_red 'KILLING MEMCACHE';launchctl stop homebrew.mxcl.memcached; sleep 2;print_blue 'STARTING MEMCACHE';launchctl start homebrew.mxcl.memcached"
alias dynamo='bundle exec fake_dynamo --port 4567'
alias sphinx='rake ts:rebuild'
alias lion='rake ts:rebuild'

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
alias cop='rubocop --auto-correct'

#git
alias promptgit="mate ~/dotfiles/.gitconfig"
alias st="git status"
alias gst="st"
alias glog="git l"
alias prune="git remote prune origin"
alias push="git push origin \$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')"
alias rebase="git rebase master"
alias pull="git pull; prune"
alias squash="sq"
alias b="git b"
alias stash="git stash"
alias pop="git stash pop"
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

#functions
mp()
{
	man -t $@ | open -f -a /Applications/Preview.app ;
}
function nuke_step()
{
  ps ax | grep $1 | awk '{print $1}' | xargs kill -9
}
function nuke()
{
  nuke_step passenger
  nuke_step nginx
  nuke_step multiplexer_ctl
  nuke_step scheduler_ctl
  nuke_step Terminal
}

function tabname {
  printf "\e]1;$1\a"
}

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# . ~/dotfiles/scripts/.prompt.shexport PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
