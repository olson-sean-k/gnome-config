#! /usr/bin/env bash

# Link Gnome Shell extensions.
for path in "$REPO_ROOT/gnome-shell/extensions"/* ; do
  ln -sf \
    "$path" \
    ~/".local/share/gnome-shell/extensions/$(basename $path)"
done
