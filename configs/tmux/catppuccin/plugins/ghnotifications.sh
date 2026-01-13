# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/aaronpowell/tmux-weather

# vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
#   expr = true,
#   replace_keycodes = false
# })
# vim.g.copilot_no_tab_map = true

show_ghnotifications() { # This function name must match the module name!
  local index icon color text module

  notifications="$(gh api notifications --jq length)"

  index=$1 # This variable is used internally by the module loader in order to know the position of this module
  icon="$(  get_tmux_option "@catppuccin_ghnotifications_icon"  " "           )"
  color="$( get_tmux_option "@catppuccin_ghnotifications_color" "$thm_blue" )"
  text="$(  get_tmux_option "@catppuccin_ghnotifications_text"  "$notifications" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

