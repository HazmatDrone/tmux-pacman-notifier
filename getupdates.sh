#!/usr/bin/env/ bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_updates() {
	echo "HELLO"
	local updates="$(checkupdates | wc -l)"
	if [[ updats > 0 ]]; then
		echo updates
	fi
}

main() {
	print_updates
}

main
