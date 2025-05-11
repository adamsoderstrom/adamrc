#!/bin/bash

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

function ign() {
  targeted_ign_repo="$1"

  if [[ -z "$1" ]]; then
    # If no repo is targeted, select one from all @noaignite repos
    repos=$(gh repo list noaignite --no-archived -L 200 --json name,url)
    repo_names=$(echo "$repos" | jq -r '.[].name')

    targeted_ign_repo=$(echo "$repo_names" | gum filter --placeholder "Repo name" --no-limit)
  fi

  local_matches="$(ls -d $HOME/Documents/NoA/Projects/* | rg ".*($targeted_ign_repo)$" -or '$1')"

  if [[ -z "$local_matches" ]] && [[ -n "$targeted_ign_repo" ]]; then
    echo "No local matches found for $targeted_ign_repo. Cloning from GitHub..."
    gh repo clone noaignite/$targeted_ign_repo $HOME/Documents/NoA/Projects/$targeted_ign_repo
    local_matches="$(ls -d $HOME/Documents/NoA/Projects/* | rg ".*($targeted_ign_repo)" -or '$1')"
  fi

  if [[ $(echo "$local_matches" | wc -l) -gt 1 ]]; then
    echo "Multiple local matches found for $targeted_ign_repo"
    echo "$local_matches"
    return 1
  fi

  create_attach_switch_to_tmux_session "$local_matches"
}
