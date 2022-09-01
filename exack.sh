#!/bin/bash

# Search elixir code with ack
# By default skip the dependencies and test directories
# Thanks to @muru from Linux and Unix stackexchange for helping me with the right shell script for this!
# https://unix.stackexchange.com/a/710968/440444
ignore_dirs=("deps" "test" "config" "priv")
ign_dirs=()
for i in "${ignore_dirs[@]}"; do
  ign_dirs+=("--ignore-dir=$i");
done


# By default skip certain scripts
ignore_files=("is:mix.exs" "is:credo.exs" "is:.formatter.exs")
ign_files=()
for i in "${ignore_files[@]}"; do
  ign_files+=("--ignore-file=$i");
done

pager=less
file_types=elixir:ext:ex,exs,eex,heex

search_string=$1
ack "$search_string" --pager="$pager" --type-set="$file_types" "${ign_dirs[@]}" "${ign_files[@]}" --noenv "${@:2}"

