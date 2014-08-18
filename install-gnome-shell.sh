#! /usr/bin/env bash

# Link Gnome Shell extensions.
shopt -s nullglob
for path in "$REPO_ROOT/gnome-shell/extensions"/* ; do
  ln -fns \
    "$path" \
    ~/".local/share/gnome-shell/extensions/$(basename $path)"
done
