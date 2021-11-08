#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_updates() {
	local format=$(get_tmux_option @pacman-update-format "")
	local prefix=$(get_tmux_option @pacman-update-prefix " ")
	local suffix=$(get_tmux_option @pacman-update-suffix " ")
	local updates="$(checkupdates | wc -l)"
	printf "$format/$prefix/$updates/$suffix"

	#if [[ updates > 0 ]]; then
	#fi
}

main() {
	print_updates
}

main
