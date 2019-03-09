#!/usr/bin/env bash

set -e

# Delete tag just created
git tag -d "v$npm_package_version";

# Build files
node ./buildFile.js;
git add built.js;

# Build Commit
git commit -m "built";

git tag "$npm_config_tag_version_prefix$npm_package_version" -am $npm_package_version;

git push origin "v$npm_package_version"

# Revert Build commit
git reset --hard HEAD~1;

