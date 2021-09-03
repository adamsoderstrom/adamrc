#
# Gropen
# ––––
#
#
b_flag=''
files=''
verbose='false'

print_help() {
    # Display Help
    echo "Gropen"
    echo "––––"
    echo
    echo 
    echo "Syntax: gropen [-b|h]"
    echo "options: "
    echo "-b     Access the repo on the current branch"
    echo "-h     Print this Help."
    echo
}


gropen () {
    while getopts 'abf:v' flag; do
        case "${flag}" in
            b) 
                b_flag='true'
                ;;
            h) 
                print_help
                ;;
            *) 
                print_help
                ;;
        esac
    done

    remote=$(git remote get-url --push origin)

    if [ "$b_flag" = 'true' ]
    then
        branch=$(git branch --show-current)
        remote="$remote/tree/$branch"
    fi

    open -e $remote
}