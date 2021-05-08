# VIMCONTROL
bindkey -v
export EDITOR='vim'

HIST_IGNORE_SPACE=true

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(
  brew dirhistory torrent git battery colorize pass
)
# cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

setopt CORRECT
COMPLETION_WAITING_DOTS=true
DISABLE_UPDATE_PROMPT=true

# Loads J
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# changes pwd of $HOME to ~
function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

# sets prompt character
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '𐂃͠ ' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '>'
}

function history_num {
  LINE_NUM=$(history | wc -l | sed 's: ::g')
  ((LINE_NUM++))
  echo "[${LINE_NUM}]"
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
$(history_num) $(virtualenv_info)$(prompt_char) '

RPROMPT='$(battery_pct_remaining 2>/dev/null)'

function passgen
{
  head -c 20 /dev/urandom | shasum -b -a 256 | xxd -r -p | base64
}

# GPG 2.1.x SSH support
# See : http://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

alias gap='git add --patch'
alias i='npm install';
alias t='npm test';
alias s='npm start';
alias gco='git checkout';
alias gcob='git checkout -b';
alias emptytrash='sudo rm -Rf ~/.Trash/*';
alias shrug='echo "¯\_(ツ)_/¯"';
alias p='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend';
alias rmhosts='rm ~/.ssh/known_hosts';

alias kali='docker run -it --rm -w /data -v $(pwd):/data kalilinux/kali-rolling'

export GOPATH="/Users/fijimunkii/go"
export HOMEBREW_NO_ANALYTICS=1;
#eval "$(ssh-agent -s)" >/dev/null
#ssh-add -K ~/.ssh/id_rsa 2>/dev/null

PATH="/Users/fijimunkii/Library/Python/3.7/bin:$PATH"
PATH="/Users/fijimunkii/bin:$PATH"

