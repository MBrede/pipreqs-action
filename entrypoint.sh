#!/bin/sh -l

python /collect_reqs.py $INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $INPUT_RECURSIVE

set -e
sh -c "ls"

git config --global --add safe.directory /github/workspace
git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "$GITHUB_ACTOR@users.noreply.github.com"

if !(git diff --exit-code --stat); then exit 0; fi

git add -A
git commit -m "Updated requirements file"
git push -u origin HEAD
