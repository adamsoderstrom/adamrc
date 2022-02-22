#
# NoA
# ––––
# Scripts for NoA-directories
#

# Constants
NOA='/Users/adamsoderstrom/Documents/noa'

# nd
# ––––
# Change directory to/inside the NoA-directory
#
nd () {
    cd "$NOA/$1"
}

#
# np
# ––––
# Change directory to a NoA-project
#
np () {
    projdir=''
    subdir=''

while getopts 'a:c:' flag; do
  case "${flag}" in
    a)
        echo $OPTARG
        ;;
    c) 
        echo $OPTARG
        ;;
  esac
done


 cd "$NOA/Projects/$projdir/$subdir"
}

ninit () {
    open -a "Toggl Track"
    open -a "Spotify"
    open -a "Slack"
    open -a "Visual Studio Code"
}