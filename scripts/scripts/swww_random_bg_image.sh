#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="${1:-$HOME/wjpu}"

# Ensure swww daemon is running
if ! pgrep -x swww-daemon > /dev/null; then
  swww init
fi

# Find images and pick one randomly
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \
\) | shuf -n 1)

# Exit if no image found
if [[ -z "$WALLPAPER" ]]; then
  echo "No images found in $WALLPAPER_DIR"
  exit 1
fi

# Set wallpaper
swww img "$WALLPAPER" \
  --transition-type any \
  --transition-duration 1

echo "Wallpaper set to: $WALLPAPER"

