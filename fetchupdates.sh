#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

update_interval=$(get_tmux_option @pacman-update-interval 300)

if [[ ! -d /tmp/tmuxpacnotif ]]; then mkdir /tmp/tmuxpacnotif; fi

if [[ ! -f /tmp/tmuxpacnotif/aur || $(($(date +%s) - $(date +%s -r /tmp/tmuxpacnotif/aur))) -gt $update_interval ]]; then
	echo $(checkupdates | wc -l) > /tmp/tmuxpacnotif/pacman
	if [ -x /usr/bin/yay ]; then
		echo $(yay -Qua | wc -l) > /tmp/tmuxpacnotif/aur
	elif [ -x /usr/bin/trizen ]; then
		echo $(trizen -Qua | wc -l) > /tmp/tmuxpacnotif/aur
	elif [ -x /usr/bin/pacaur ]; then
		echo $(pacaur -Qua | awk '$2 == "aur" {print $3 $4 $5 $6}' | wc -l) > /tmp/tmuxpacnotif/aur
	elif [ -x /usr/bin/yaourt ]; then
		echo $(yaourt -Qua | grep "^aur/" | wc -l) > /tmp/tmuxpacnotif/aur
	else
		echo 0 > /tmp/tmuxpacnotif/aur
	fi
fi
