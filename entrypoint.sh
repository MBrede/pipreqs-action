#!/bin/sh -l

python /collect_reqs.py $INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $INPUT_RECURSIVE

set -e
sh -c "ls"

sh -c "git config --global user.name '${GITHUB_ACTOR}' \
      && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
      && git add requirements.txt && git commit -m 'Updated requirements file.' --allow-empty \
      && git push -u origin HEAD"
