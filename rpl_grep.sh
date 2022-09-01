#!/bin/bash

# Search elixir code with rosie pattern language

pattern_to_match=$1

# First get list of files to be searched
# find . -type f -name './deps' -prune -o -name "*.ex*" -print0  | xargs -0 rosie match -o jsonpp "$pattern_to_match"
find -type f -name "*.ex*" -print0  | xargs -0 rosie match -o subs "$pattern_to_match" | less
