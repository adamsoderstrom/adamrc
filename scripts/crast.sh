#!/bin/zsh

# pro(crast)inate -- Find all added `TODO` statements since `origin/main` via Git.
alias crast="git diff origin/main...HEAD | grep '^\+.*TODO:'"
