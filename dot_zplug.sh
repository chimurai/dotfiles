[ -d /usr/local/opt/zplug ] && export ZPLUG_HOME=/usr/local/opt/zplug
[ -d /opt/homebrew/opt/zplug ] && export ZPLUG_HOME=/opt/homebrew/opt/zplug

source $ZPLUG_HOME/init.zsh

zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"

zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
zplug 'zsh-users/zsh-completions', depth:1 # more completions

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, at:main, as:theme

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
