function vol {
  osascript -e "set Volume $1"
}
alias quiet='vol 0.01'

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


alias finder="open ."
alias back="cd -"
alias clr="clear"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias cdd="cd ../"

alias reload="source ~/.bash_profile"
alias prompt="mate ~/.bash_profile"
alias prompt2="mate /etc/motd"

alias sql="/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot"

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
alias gst="git status"
alias ss="script/start"
alias brake="bundle exec rake"
alias migrate="bundle exec rake db:migrate ; bundle exec rake db:migrate RAILS_ENV=test"
alias solr="bundle exec rake solr:create_core ; bundle exec rake solr:create_core  RAILS_ENV=test"
alias gmasters="bundle exec rake test:appearance:get_masters"
alias umasters="bundle exec rake test:appearance:upload_masters"
alias stop="osascript ~/src/stop.applescript property_app"
alias up="svn up"
alias up2="svn up; bundle install; bundle exec rake db:migrate ; bundle exec rake db:migrate RAILS_ENV=test "
alias resetdb="bundle exec rake db:drop; bundle exec rake db:create; bundle exec rake db:migrate; bundle exec rake db:fixtures:load; bundle exec rake db:test:load"
alias stopall="osascript -e 'tell application \"Terminal\" to quit' "
alias applist="rake -T appearance "
alias gmasters="bundle exec rake test:appearance:get_masters"
alias pmasters="bundle exec rake test:appearance:upload_masters"
alias masters="open /Users/zackwarburg/src/property/property_bundle/trunk/apps/property/test/appearance/expected"
alias prodlogs="ssh zack@log1.core.densd.appfolio.net"
alias qalogs="ssh zack@log201.core.atl.appfolio.net"
alias sel="launchctl stop homebrew.mxcl.selenium-server-standalone;sleep 5;launchctl start homebrew.mxcl.selenium-server-standalone"
alias fit="rake fit"
alias c="clear"
alias mem="launchctl stop homebrew.mxcl.memcached; sleep 2;launchctl start homebrew.mxcl.memcached"


alias glog="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias be="bundle exec"

mp() { man -t $@ | open -f -a /Applications/Preview.app ;}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
