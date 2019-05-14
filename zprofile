EDITOR=vim;     export EDITOR
PAGER=less;     export PAGER

if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export WORKON_HOME=~/src/env
source `which virtualenvwrapper.sh`

export RIPGREP_CONFIG_PATH=~/etc/ripgreprc

export FZF_DEFAULT_OPTS=--no-bold
