#!/usr/bin/env bash

set -e

node ./buildFile.js;

g add built.js;

g commit -m "built";
