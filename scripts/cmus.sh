function cmus() {
  launchctl unload -w '/System/Library/LaunchAgents/com.apple.rcd.plist'&>/dev/null &
  cmuscontrold &>/dev/null &
  command cmus
}
