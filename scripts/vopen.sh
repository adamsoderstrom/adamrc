
# Open Vercel deployment, based on the current git branch
# You need to have a `.env.vopen` file with `project_name` and `scope_slug` defined.
# Read more here: https://vercel.com/docs/deployments/generated-urls
vopen() {
  project_name=$(cat ./.env.vopen | rg "^project_name=(?:\"?)(.*?)(?:\"?)$" -or '$1')
  scope_slug=$(cat ./.env.vopen | rg "^scope_slug=(?:\"?)(.*?)(?:\"?)$" -or '$1')
  branch_name=$(git rev-parse --abbrev-ref HEAD)

  branch_name_formatted=$(echo "$branch_name" | sed 's/\//-/g')
  
  open "https://$project_name-git-$branch_name_formatted-$scope_slug.vercel.app/"
}

vopen
