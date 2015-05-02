# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.zsh/bootstrap.zsh

# External settings
source ~/.zsh/external.zsh

# Aliases
source ~/.zsh/aliases.zsh

# Custom prompt
# source ~/.zsh/prompt.zsh

# Syntax highlighting
# source ~/.zsh/syntax.zsh

# External plugins (initialized after)
# source ~/.zsh/plugins_after.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
bindkey -v
autoload zmv
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# End of lines configured by zsh-newuser-install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
