export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

source ~/dotfiles/scripts/rake_autocomplete.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=TextEdit

export RUBY_HEAP_SLOTS_INCREMENT=2000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_HEAP_FREE_MIN=1000000
export RUBY_HEAP_MIN_SLOTS=8000000
export RUBY_GC_MALLOC_LIMIT=300000000

# set prompt: ``username@hostname:/directory $ ''
PS1="\u@:\w"
case `id -u` in
      0) PS1="${PS1}# ";;
      *) PS1="${PS1}$ ";;
esac
#http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/
PS1="\[\033[0;96m\]\w \[\033[0;32m\]\u\[\033[0;34m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]$ "

function parse_git_branch_and_add_brackets {
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


#CD
alias dot='cd ~/dotfiles'
alias admin='cd ~/src/admin/trunk'
alias trunk='cd ~/src/property/property_bundle/trunk'
alias p='cd ~/src/property/property_bundle/trunk/apps/property'
alias prop='cd ~/src/property/property_bundle/trunk/apps/property'
alias l='cd ~/src/property/property_bundle/trunk/apps/listings'
alias listings='cd ~/src/property/property_bundle/trunk/apps/listings'
alias t='cd ~/src/property/property_bundle/trunk/apps/tportal'
alias tportal='cd ~/src/property/property_bundle/trunk/apps/tportal'
alias mirror='cd ~/src/mirror-mirror'
alias masters="cd ~/src/property/property_bundle/trunk/apps/property/test/appearance/expected"

#Rake
alias be="bundle exec"
alias brake="bundle exec rake"
alias solr="brake solr:reindex"
alias migrate="brake db:migrate; brake db:migrate RAILS_ENV=test"
alias up="svn up"
alias up2="svn up; bundle install; migrate"
alias resetdb="RAILS_ENV=test brake db:migrate:reset; RAILS_ENV=test brake db:fixtures:load; brake db:migrate:reset; brake db:fixtures:load"

#start/restart/clean shit up
alias ss="script/start"
alias sel="launchctl stop homebrew.mxcl.selenium-server-standalone;sleep 5;launchctl start homebrew.mxcl.selenium-server-standalone"
alias mem="launchctl stop homebrew.mxcl.memcached; sleep 2;launchctl start homebrew.mxcl.memcached"

#misc
alias stop="osascript ~/src/stop.applescript property_app"
alias stopall="osascript -e 'tell application \"Terminal\" to quit' "
alias gmasters="brake test:appearance:get_masters"
alias pmasters="brake test:appearance:upload_masters"
alias prodlogs="ssh zack@log1.core.densd.appfolio.net"
alias qalogs="ssh zack@log201.core.atl.appfolio.net"
alias fit="rake fit"
alias sql="/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot"


#git
alias gst="git status"
alias glog="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

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


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
