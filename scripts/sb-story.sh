sb-story() {
  story_args="null"
  component_name=$(echo "$1" | sed 's/\.\/\(.*\)/\1/' )

  if [ -z "${1}" ];
  then
    echo "Please pass name of file."
    return 1
  fi
 
cat <<EOF
import $component_name from './$component_name'

export default {
  component: $component_name,
}

export const Default = {
  args: $story_args
}
EOF
}
