#!/bin/bash

function noa() {
  if [[ -d "$HOME/Documents/NoA/Projects/$1" ]];
  then
    create_attach_switch_to_tmux_session $1
  else
    echo "$1 isn't found among NoA projects"
    return 1
  fi
}

function create_attach_switch_to_tmux_session() {
  tmux has-session -t $1 2>/dev/null
  SESSION_EXISTS=$?
  
    # If TMUX is attached.
  if [[ ! -z "${TMUX}" ]]; then
    if [ $SESSION_EXISTS = 0 ]; then
        # And session does exist, then switch to session.
        tmux switch -t $1
      else
        # If session doesn't exist, then create it.
        tmux new-session -s $1 -d -c "$HOME/Documents/NoA/Projects/$1"
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
      tmux new-session -s $1 -c "$HOME/Documents/NoA/Projects/$1"
    fi
  fi
}
