#! /usr/bin/env bash

declare -A user_dir_mapping=(["DESKTOP"]="desktop" ["DOWNLOAD"]="tmp")

# TODO: This doesn't handle intermediate failures very well.
for name in "${!user_dir_mapping[@]}" ; do
  target_basename="${user_dir_mapping["$name"]}"
  current_path="$(xdg-user-dir "$name")"

  if [[ ! -d "$current_path" ]] ; then
    # The directory doesn't exist or xdg-user-dir couldn't find it.
    # Continue silently.
    continue
  fi
  # Update the configuration.
  xdg-user-dirs-update --set "$name" "$target_basename"

  if [[ "$(basename "$current_path")" = "$target_basename" ]] ; then
    echo "path to user directory already exists: skipping: $current_path"
    continue
  fi
  # Move the original directory (if necessary).
  mv "$current_path" "$(dirname "$current_path")"/"$target_basename"
done
