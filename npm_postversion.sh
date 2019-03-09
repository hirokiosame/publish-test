#!/usr/bin/env bash

set -e

# Build files
node ./buildFile.js;
git add built.js;

# Build Commit
git commit -m "$npm_package_version-built";

# Delete tag just created
TAGNAME="$npm_config_tag_version_prefix$npm_package_version"
git tag -d $TAGNAME;
git tag $TAGNAME -am $npm_package_version;

# Revert Build commit
git revert --no-commit HEAD~1;
g commit -m "$TAGNAME Release";
