# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/aaronpowell/tmux-weather

show_newsboat() { # This function name must match the module name!
  local index icon color text module

  info="$(newsboat -x print-unread | grep -Eo '[0-9]+')"

  index=$1 # This variable is used internally by the module loader in order to know the position of this module
  icon="$(  get_tmux_option "@catppuccin_ghnotifications_icon"  "󰑬 "           )"
  color="$( get_tmux_option "@catppuccin_ghnotifications_color" "$thm_yellow" )"
  text="$(  get_tmux_option "@catppuccin_ghnotifications_text"  "$info" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}


