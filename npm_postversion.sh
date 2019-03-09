#!/usr/bin/env bash

set -e

# Delete tag just created
git tag -d "v$npm_package_version";

# Build files
node ./buildFile.js;
git add built.js;

# Build Commit
git commit -m "built";

git tag -a "$npm_config_tag_version_prefix$npm_package_version" -m $npm_package_version;

# git push origin "v$npm_package_version"

# Revert Build commit
git push origin master;
# git reset --hard HEAD~1;

