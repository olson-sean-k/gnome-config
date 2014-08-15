#! /usr/bin/env bash

realpath() {
  (
    TARGET_FILE="$1"
    cd "$(dirname "$TARGET_FILE")"
    TARGET_FILE="$(basename "$TARGET_FILE")"

    while [ -L "$TARGET_FILE" ]; do
      TARGET_FILE="$(readlink "$TARGET_FILE")"
      cd "$(dirname "$TARGET_FILE")"
      TARGET_FILE="$(basename "$TARGET_FILE")"
    done

    PHYS_DIR="$(pwd -P)"
    echo "$PHYS_DIR/$TARGET_FILE"
  )
}

REPO_ROOT=$(dirname $(realpath $BASH_SOURCE))

# Link Gnome Shell extensions.
ln -s \
  "$REPO_ROOT/extensions/extra-panels@darkxst.feathertop.org" \
  ~/.local/share/gnome-shell/extensions/extra-panels@darkxst.feathertop.org
