export SCRIPTS_DIR=`dirname "$0"`

source $SCRIPTS_DIR/bat.sh
source $SCRIPTS_DIR/cgpt.sh
source $SCRIPTS_DIR/chck.sh
source $SCRIPTS_DIR/cmus.sh
source $SCRIPTS_DIR/envf.sh
source $SCRIPTS_DIR/ffmpeg.sh
source $SCRIPTS_DIR/gh.sh
source $SCRIPTS_DIR/git_snippets.sh
source $SCRIPTS_DIR/lenv.sh
source $SCRIPTS_DIR/misc.sh
source $SCRIPTS_DIR/next.sh
source $SCRIPTS_DIR/noa.sh
source $SCRIPTS_DIR/noamux.sh
source $SCRIPTS_DIR/nxb.sh
source $SCRIPTS_DIR/pplx.sh
source $SCRIPTS_DIR/shorthands.sh
source $SCRIPTS_DIR/smackdown.sh
source $SCRIPTS_DIR/t.sh
source $SCRIPTS_DIR/y.sh

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:$(go env GOPATH)/bin

export fpath=($SCRIPTS_DIR/../completions $fpath)

