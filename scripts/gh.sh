# ghpr - View a GitHub pull request
alias ghpr="gh pr view"

# ghprw - View a GitHub pull request in browser
alias ghprw="gh pr view --web"

# ghprc - View a GitHub pull request
alias ghprc="gh pr create"

alias ghconflict="gh pr list --state open --json number,title,mergeable | jq -r '.[] | select(.mergeable==\"CONFLICTING\") | [.number, .title] | @tsv'"
