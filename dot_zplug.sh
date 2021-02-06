export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"

zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
