current_task="$(timew)"
if [[ $current_task == "There is no active time tracking." ]]; then
  echo ""
else
  tags=$(echo "$current_task" | rg 'Tracking (.*)' -or '$1')
  echo "$tags"
fi
