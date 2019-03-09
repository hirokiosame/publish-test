#!/usr/bin/env bash

set -e


# Build files
echo 'Building';
node ./buildFile.js;
git add built.js;

# Build Commit
echo 'Committing build';
git commit -m "$npm_package_version-built";

# Delete tag just created
echo 'Rewriting tag';
git tag -d "v$npm_package_version";
git tag -a "$npm_config_tag_version_prefix$npm_package_version" -m $npm_package_version;

# git push origin "v$npm_package_version";

# Revert Build commit
# git push origin master;
# git reset --soft HEAD~1;
echo 'Reverting';
git revert HEAD~1;

