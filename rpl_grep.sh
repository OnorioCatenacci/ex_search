#!/bin/bash

# Search elixir code with rosie pattern language

# First get list of files to be searched
find . -type f \( -name "*.ex*" -o -name "*.*eex" \) -print0 | xargs -0 rosie grep -o jsonpp elixir.module