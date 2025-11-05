# A JQ command to get sizes of each key in a JSON object.
export JQ_SIZE="[[to_entries | .[] | [.key, (.value | tostring | length)]] | sort_by(.[1])]"

export centra_checkout_swagger_url="https://demo-docs.centra.com/api/checkout/swagger"
