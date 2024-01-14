#!/bin/bash

# get the current date in the format YYYY-MM-DD
export TZ=America/Bogota
CURRENT_DATE=$(date +"%F")

# squash all previous commits with the same name
PREVIOUS_COMMITS=$(git log --pretty="%h" --grep=$CURRENT_DATE)
COMMIT_COUNT=$(echo "$PREVIOUS_COMMITS" | wc -w)
if [ "$COMMIT_COUNT" -gt 0 ]; then
    git reset --soft HEAD~$COMMIT_COUNT
fi
# commit changes with the current date as the commit message
git add .
git commit -m "$CURRENT_DATE"

# force push the changes
git push --force origin HEAD:main
