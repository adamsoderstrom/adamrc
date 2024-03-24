# nxb
#
# Browse next.js block props
# 
function nxb() {
  next_data=$(https "$1" | pup 'script#__NEXT_DATA__ text{}' | jq '.props.pageProps.page.blocks')
  block_names=$(echo "$next_data" | jq -r '.[].name')

  formatted_block_names=$(echo "$block_names" | awk '{print NR-1, $0}')

  targeted_block="$(echo "$formatted_block_names" | gum filter --no-sort --placeholder "Block name" --no-limit)"
  targeted_block_idx="$(echo $targeted_block | rg '(.*)\s' -or '$1')"
  targeted_block_name="$(echo $targeted_block | rg '\s(.*)' -or '$1')"

  echo "$next_data" | jq ".[$targeted_block_idx]"
  
}
