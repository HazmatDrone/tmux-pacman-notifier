#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

update_interval=$(get_tmux_option @pacman-update-interval 300)

while true; do

	if [[ -d FILE ]]; then mkdir /tmp/tmuxpacnotif; fi
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

	sleep $update_interval
done
