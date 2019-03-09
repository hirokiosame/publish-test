#!/usr/bin/env bash

set -e

# Build files
echo "1. Building files";
node ./buildFile.js;
git add built.js;

# Build Commit
echo "2. Committing";
git commit -m "$npm_package_version-built";

# Delete tag just created
echo "3. Replacing tag";
TAGNAME="$npm_config_tag_version_prefix$npm_package_version"
git tag -d $TAGNAME;
git tag $TAGNAME -am $npm_package_version;

# Revert Build commit
echo "4. Reverting dist files";
git revert --no-commit HEAD~1;
g commit -m "$TAGNAME Release";
