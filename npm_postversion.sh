#!/usr/bin/env bash

set -e

# Delete tag just created
git tag -d "v$npm_package_version";

# Build files
node ./buildFile.js;
git add built.js;

# Build Commit
git commit -m "built";

git tag "v$npm_package_version";

# Revert Build commit
git reset --hard HEAD~1;

# node -e "console.log(process.env)" > env.log;




