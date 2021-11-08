#!/usr/bin/env/ bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_updates() {
	local format=$(get_tmux_option @forecast-format "%C+%t+%w")
	local updates="$(checkupdates | wc -l)"

	echo "HELLO WORLD"
	if [[ updats > 0 ]]; then
		echo updates
	fi
}

main() {
	print_updates
}

main
