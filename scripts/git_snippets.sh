#
# Git snippets
# ––––
#
#

files=''
verbose='false'

print_help() {
    # Display Help
    echo "Gropen"
    echo "––––"
    echo
    echo "Syntax: gropen [-b|h|i]"
    echo "options: "
    echo "-b     Access the repo on the current branch"
    echo "-h     Print this help."
    echo "-i     Attempt accessing matching issue to the current branch name."
    echo "       Expecting a branch containing an integer value."
    echo "       Example: 'feature/*issue_number*' / 'hotfix/*issue_number*' or '*issue_number*'"
    echo

    return 1
}

# guf - List git untracked files
alias guf="git ls-files --others --exclude-standard"

gropen () {
    b_flag=''
    h_flag=''
    i_flag=''
    open_remote=''
    while getopts 'bhi' flag; do
        case "${flag}" in
            b)
                b_flag='true'
                open_remote='true'
                ;;
            h)
                print_help
                ;;
            i)
                i_flag='true'
                open_remote='true'
                ;;
            *)
                open_remote='true'
                print_help
                ;;
        esac
    done

    # No options passed
    if [ $OPTIND -eq 1 ]
    then
        open_remote='true'
    fi

    remote=$(git remote get-url --push origin)

    if [ "$b_flag" = 'true' ]
    then
        branch=$(git branch --show-current)
        remote="$remote/tree/$branch"
    fi

    if [ "$i_flag" = 'true' ]
    then
        branch=$(git branch --show-current)
        issue_number=$(echo $branch | sed 's/[^0-9]*//g')
        remote="$remote/issues/$issue_number"
    fi

    if [ "$open_remote" = 'true' ]
    then
        open -e $remote
    fi

    
}
