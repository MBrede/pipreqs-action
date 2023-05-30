#!/bin/sh -l

python /collect_reqs.py $INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $INPUT_RECURSIVE

set -e
sh -c "ls"

if [$INPUT_TOKEN]
then
  sh -c "echo '${INPUT_TOKEN}' > token.txt"
  sh -c "gh auth login --with-token < token.txt"
fi

sh -c "git config --global --add safe.directory /github/workspace && git config --global user.name '${GITHUB_ACTOR}' \
      && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
      && git add requirements.txt && git commit -m 'Updated requirements file.' --allow-empty \
      && git push -u origin HEAD"
