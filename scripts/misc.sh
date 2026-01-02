#
# Misc
# ––––
# Scripts/Aliases considered miscellaneous
#
alias refresh="source ~/.zshrc"
alias nowplaying="nowplaying-cli"
alias cal="gcal --starting-day=1"

# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
