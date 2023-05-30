#!/bin/sh -l

python /collect_reqs.py $INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $INPUT_RECURSIVE

set -e

if [$INPUT_TOKEN]
then
  git config --global url."https://${INPUT_TOKEN}:@github.com/".insteadOf "https://github.com/"
fi

sh -c "ls"

sh -c "git config --global --add safe.directory /github/workspace && git config --global user.name '${GITHUB_ACTOR}' \
      && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
      && git add requirements.txt && git commit -m 'Updated requirements file.' --allow-empty \
      && git push -u origin HEAD"
