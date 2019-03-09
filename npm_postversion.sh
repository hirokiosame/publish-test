#!/usr/bin/env bash

set -e

echo "1. Rewriting tag";
git tag -d "v$npm_package_version";

# Build files
echo "2. Building";
node ./buildFile.js;
git add built.js;

# Build Commit
echo "3. Committing build";
git commit -m "$npm_package_version-built";

# Delete tag just created
echo "4. Retagging";
git tag -a "$npm_config_tag_version_prefix$npm_package_version" -m $npm_package_version;

# git push origin "v$npm_package_version";

# Revert Build commit
# git push origin master;
# git reset --soft HEAD~1;
echo "5. Reverting";
git revert HEAD~1;

