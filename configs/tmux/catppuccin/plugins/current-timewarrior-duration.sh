current_task="$(timew)"
if [[ $current_task == "There is no active time tracking." ]]; then
  echo ""
else
  duration=$(echo "$current_task" | rg 'Total\s+(.*)' -or '$1')
  
  echo "$duration"
fi
