#! /usr/bin/env bash

realpath() {
  (
    target_file="$1"
    cd "$(dirname "$target_file")"
    target_file="$(basename "$target_file")"

    while [ -L "$target_file" ]; do
      target_file="$(readlink "$target_file")"
      cd "$(dirname "$target_file")"
      target_file="$(basename "$target_file")"
    done

    phys_dir="$(pwd -P)"
    echo "$phys_dir/$target_file"
  )
}

export REPO_ROOT="$(dirname $(realpath $BASH_SOURCE))"

"$REPO_ROOT/install-gnome-shell.sh"
"$REPO_ROOT/install-gnome-terminal.sh"
