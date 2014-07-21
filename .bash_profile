export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

source ~/dotfiles/scripts/rake_autocomplete.bash
source ~/dotfiles/bash/color.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=TextEdit

# \[\e[0;96m\]\w  --> full working directory
# \[\e[0;32m\]\u  --> current username 

# branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

PS1="\[\e[0;96m\]\w \[\e[0;32m\]\u\[\e[0;91m\]\$(parse_git_branch_and_add_brackets) \[\e[0m\]$ "

function parse_git_branch_and_add_brackets 
{
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

function parse_git_branch
{
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \1/'
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

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#CD
alias dot='cd ~/dotfiles'
alias p='cd ~/src/production'
alias f='cd ~/src/fuzzy-adventure'
alias y='cd ~/src/yolo-nemesis'
alias src='cd ~/src'

#Rake
alias be="bundle exec"
alias brake="bundle exec rake"
alias solr="brake solr:reindex"
alias migrate="brake db:migrate; brake db:migrate RAILS_ENV=test"
alias up="git pull; bundle install; migrate; say 'migrating like a boss';"
alias resetdb="brake db:migrate:reset; brake db:fixtures:load; brake db:migrate:reset RAILS_ENV=test"
alias resetseed="brake db:migrate:reset RAILS_ENV=test; brake db:migrate:reset; brake db:seed"

#start/restart/clean shit up
alias ss="script/start"
alias sel="print_red 'KILLING SELENIUM';launchctl stop homebrew.mxcl.selenium-server-standalone;sleep 3;print_blue 'STARTING SELENIUM';launchctl start homebrew.mxcl.selenium-server-standalone"
alias mem="print_red 'KILLING MEMCACHE';launchctl stop homebrew.mxcl.memcached; sleep 2;print_blue 'STARTING MEMCACHE';launchctl start homebrew.mxcl.memcached"

#mysql
alias mysqlstart="sudo /Library/StartupItems/MySQLCOM/MySQLCOM start"
alias mysqlstop="sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias mysqlstatus="ps aux | grep mysql | grep -v grep"

#git
alias promptgit="mate ~/dotfiles/.gitconfig"
alias st="b;line_break 30;git status"
alias gst="st"
alias glog="git l"
alias prune="git remote prune origin"
alias pull="git pull; prune"
alias squash="sq"
alias b="git b"
alias push="git push origin \$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')"

function line_break()
{
	seq  -f "#" -s '' $1;echo
}

function sq()
{
	git rebase -i HEAD~"$*"
}

#git autocomplete
if [ -f ~/dotfiles/bash/.git-completion.bash ]; then
  . ~/dotfiles/bash/.git-completion.bash
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
