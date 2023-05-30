#!/bin/sh -l

python /collect_reqs.py $INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $INPUT_RECURSIVE

set -e

git config --global --add safe.directory /github/workspace
git config --global user.name '${GITHUB_ACTOR}'
git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com'

if [[ -z $INPUT_TOKEN ]];
then
  echo "got no token!"
else
  git remote remove origin
  git remote add origin "https://${INPUT_TOKEN}@github.com/${INPUT_REPO}"
fi

sh -c "ls"

git add requirements.txt
git commit -m 'Updated requirements file.' --allow-empty
git push -u origin HEAD
