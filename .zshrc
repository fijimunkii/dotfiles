# VIMCONTROL
bindkey -v
export EDITOR='vim'

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(
  brew brew-cask dirhistory torrent git git-remote-branch 
  battery colored-man colorize
)
# cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

setopt CORRECT CORRECT_ALL
COMPLETION_WAITING_DOTS=true
DISABLE_UPDATE_PROMPT=true

# sets the title
case $TERM in
  xterm*)
  precmd () {print -Pn "\e]0;%n@%m: %~\a"}
  ;;
esac

# Loads J
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# changes pwd of $HOME to ~
function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

# sets prompt character
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '>'
}

# echoes hostname
function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# constructs the prompt
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
function prompt_user { echo "%{$fg[magenta]%}%n%{$reset_color%}" }
function prompt_machine { echo "%{$fg[yellow]%}%m%{$reset_color%}" }
function prompt_dir { echo "%{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}" }

PROMPT='
$(prompt_user) at $(prompt_machine) in $(prompt_dir) $(git_prompt_info)
$(virtualenv_info)$(prompt_char) '

RPROMPT='$(battery_pct_remaining)'

function precompile
{
    bundle exec rake assets:precompile; \
      git add --all .; git commit -m $1;
}

function install
{
    if hash yum 2>/dev/null; then
        sudo yum install $1; 
    elif hash apt-get 2>/dev/null; then
        sudo apt-get install $1;
    elif hash brew 2>/dev/null; then
        brew install $1;
    fi
}

function passgen
{
  if hash xclip 2>/dev/null; then
    head -c $1 /dev/urandom | base64 - | xclip -i;
  elif hash pbcopy 2>/dev/null; then
    head -c $1 /dev/urandom | base64 - | pbcopy;
  elif hash gpm 2>/dev/null; then
    head -c $1 /dev/urandom | base64 - | gpm;
  fi
}

function rakeitgood
{
  rake db:drop;rake db:create;rake db:migrate;rake db:migrate RAILS_ENV=test; \
    rake db:seed; rake db:seed RAILS_ENV=test;
}


alias lyrics='sh ~/.config/pianobar/lyrics.sh'
alias pushitgood='git push origin master; git push heroku master;'
alias ll='ls -la'
alias reload='source ~/.zshrc'
alias pair='tmux new-session -s pair'
alias mysql='/usr/local/Cellar/mysql/5.6.15/support-files/mysql.server start'
alias sleep='osascript ~/Projects/automate/sleep.scpt'
alias k='bundle exec kitchen'
alias sasswatch='sass -w .:.'
alias jailbreak='sudo xattr -rd com.apple.quarantine'
alias viz='mpdviz -f /tmp/mpd.fifo -v lines -i true -d false'
alias gap='git add --patch'
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app'
alias npmreboot='rm -rf node_modules && npm cache clean && npm install'
alias i='npm install';
alias t='npm test';
alias s='npm start';
alias tw='npm run testwatch';
alias gco='git checkout';
alias gcob='git checkout -b';
alias emptytrash='sudo rm -Rf ~/.Trash/*';
alias shrug='echo "¯\_(ツ)_/¯"';
alias teatime='sleep 240 && say "tea time!"';
