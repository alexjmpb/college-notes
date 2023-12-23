#!/bin/bash

# get the current date in the format YYYY-MM-DD
export TZ=America/Bogota
CURRENT_DATE=$(date +"%F")

# commit changes with the current date as the commit message
git add .
git commit -m "$CURRENT_DATE"

# squash all previous commits with the same name
PREVIOUS_COMMITS=$(git rev-list --all --grep="$CURRENT_DATE")
git reset --soft HEAD~$(echo "$PREVIOUS_COMMITS" | wc -w)
git commit -m "$CURRENT_DATE"

# force push the changes
git push --force
