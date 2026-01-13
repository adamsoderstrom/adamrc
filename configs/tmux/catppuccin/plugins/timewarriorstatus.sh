show_timewarriorstatus() { # This function name must match the module name!

  local index icon color duration text module

  # The `current-timewarrior-duration` must be in the same directory as this script
  duration="$( get_tmux_option "@catppuccin_timewarriorstatus_text"  "#($HOME/.tmux/plugins/tmux/custom/current-timewarrior-duration.sh)" )"

  if [[ -n "$duration" && $duration != ""  ]]
  then
    index=$1 # This variable is used internally by the module loader in order to know the position of this module

    # The `current-timewarrior-tags` must be in the same directory as this script
    icon=" $(  get_tmux_option "@catppuccin_timewarriorstatus_icon"  "#($HOME/.tmux/plugins/tmux/custom/current-timewarrior-tags.sh)" )"
    color="$( get_tmux_option "@catppuccin_timewarriorstatus_color" "$thm_orange" )"

    module=$( build_status_module "$index" "$icon" "$color" "$duration" )

    echo "$module"
  fi
}
