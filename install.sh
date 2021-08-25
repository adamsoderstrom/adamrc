DEFAULT_ZSH_PATH=~/.zshrc
EXPORT_STR="export ADAM=\"$PWD/scripts\""

# What shell is running?
# Is it zsh? target .zshrc
if [ $SHELL = "/bin/zsh" ]
then
    echo "installation started..."

    echo "locating .zshrc..."
    echo "  searching in default directory..."

    if [ -f "$DEFAULT_ZSH_PATH" ]; then
        echo "$DEFAULT_ZSH_PATH exists."
    else
        echo "  .zshrc not found in default directory!"
        echo "  creating $DEFAULT_ZSH_PATH..."
        touch $DEFAULT_ZSH_PATH
    fi
    
    grep -w "$EXPORT_STR" $DEFAULT_ZSH_PATH

    # Export doesn't exists yet.
    if [ $? -eq 1 ]
    then
        echo $EXPORT_STR >> $DEFAULT_ZSH_PATH
    fi

else
    echo "Your shell isn't supported by this package. The package currently support:"
    echo "/bin/zsh"
fi

# Else, print error