# A JQ command to get sizes of each key in a JSON object.
export JQ_SIZE="[[to_entries | .[] | [.key, (.value | tostring | length)]] | sort_by(.[1])]"
