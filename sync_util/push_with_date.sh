#!/bin/bash

# get the current date in the format YYYY-MM-DD
CURRENT_DATE=$(date +%F)

# commit changes with the current date as the commit message
git add .
git commit -m "$CURRENT_DATE"

# squash all previous commits with the same name
PREVIOUS_COMMITS=$(git rev-list --all --grep="$CURRENT_DATE")
if [[ -n "$PREVIOUS_COMMITS" ]]; then
  git reset --soft HEAD~$(echo "$PREVIOUS_COMMITS" | wc -l)
  git commit --amend -m "$CURRENT_DATE"
fi

# force push the changes
git push --force