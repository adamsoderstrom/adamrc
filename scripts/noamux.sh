# @TODO: Check if $1 is a directory in NoA/projects
function noa() {
  tmux has-session -t $1 2>/dev/null
  SESSION_EXISTS=$?
  echo $SESSION_EXISTS
  
    # If TMUX is attached.
  if [[ ! -z "${TMUX}" ]]; then
    echo 'Tmux is attached'

    if [ $SESSION_EXISTS = 0 ]; then
        # And session does exist, then switch to session.
        tmux switch -t $1
      else
        # If session doesn't exist, then create it.
        tmux new-session -s $1 -d
        # and then switch to it.
        tmux switch -t $1
    fi
  else
    # If TMUX isn't attached
    # And session does exist.
    if [[ $SESSION_EXISTS = 0 ]]; then
      # Then attach the session.
      tmux attach-session -t $1
    else
      # If session doesn't exist.
      # Then create new session and attach it.
      tmux new-session -s $1
    fi
  fi
}
