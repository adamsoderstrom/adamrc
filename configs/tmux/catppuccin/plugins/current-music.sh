nowplaying_artist="$(nowplaying-cli get artist)"
nowplaying_title="$(nowplaying-cli get title)"

current_music=""

echo "$(nowplaying-cli get artist) - $(nowplaying-cli get title)"
echo "$nowplaying_artist - $nowplaying_title"

if [ "$nowplaying_title" != "" ]; then
  # only track title from media remote
  current_music="$nowplaying_title"
fi

if [ "$nowplaying_title" != "" ] && [ "$nowplaying_artist" != "" ]; then
  # artist and track title from media remote
  current_music="$nowplaying_artist - $nowplaying_title"
fi

cmus_status="$(cmus-remote -Q | rg 'status (.*)' -or '$1')"

if [ ! -z "$cmus_status" ] && [ "$cmus_status" = "playing" ]
then
  current_music="$(cmus-remote -Q | rg 'tag artist (.*)|tag title (.*)' -r '$1$2' | awk 'BEGIN {ORS=" - "} {print}' | rg '(.*) -' -or '$1')"
  echo "$current_music"
else
  echo "$current_music"
fi
