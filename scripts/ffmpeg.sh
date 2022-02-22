#
# ffmpeg
# –––
# shorthands for ffmpeg
ffsilent() {
	ffmpeg -i "$1" -c copy -an "${1%.*}-nosound.${1#*.}"
}
