
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

source '/usr/local/share/chruby/chruby.sh' #for chruby for auto switching
source '/usr/local/share/chruby/auto.sh' #for chruby for auto switching


autoload -Uz compinit && compinit

source $HOME/dotfiles/zsh/prompt
source $HOME/dotfiles/zsh/aliases

function g {
   if [[ $# > 0 ]]; then
     git $@
   else
     git status
   fi
}

# added by travis gem
[ -f /Users/manuelgarcia/.travis/travis.sh ] && source /Users/manuelgarcia/.travis/travis.sh
