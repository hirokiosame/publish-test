#!/usr/bin/env bash

set -e

node ./buildFile.js;

git add built.js;

git commit -m "built";
