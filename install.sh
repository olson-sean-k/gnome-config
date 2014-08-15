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

repo_root=$(dirname $(realpath $BASH_SOURCE))

# Link Gnome Shell extensions.
ln -s \
  "$repo_root/extensions/extra-panels@darkxst.feathertop.org" \
  ~/.local/share/gnome-shell/extensions/extra-panels@darkxst.feathertop.org
