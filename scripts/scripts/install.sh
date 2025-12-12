#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"

for dir in */ ; do
	[ -d "$dir" ] || continue
	case "$dir" in
		.git/) continue ;;
	esac
	echo "Stowing $dir"
	stow -R -t "$HOME" "$dir"
done

echo "Dotfiles installed"
