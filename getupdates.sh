#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_updates() {
	local format=$(get_tmux_option @pacman-update-format "#[fg=colour3,bg=colour0]C#[fg=color1] #{combined} ")
	local showon=$(get_tmux_option @pacman-update-show-on "any")

	local pac_sub="\#{pacman}"
	local aur_sub="\#{aur}"
	local combined_sub="\#{combined}"

	nb_pac=$(checkupdates | wc -l)
	if [ -x /usr/bin/yay ]; then
		nb_aur=$(yay -Qua | wc -l)
	elif [ -x /usr/bin/trizen ]; then
		nb_aur=$(trizen -Qua | wc -l)
	elif [ -x /usr/bin/pacaur ]; then
		nb_aur=$(pacaur -Qua | awk '$2 == "aur" {print $3 $4 $5 $6}' | wc -l)
	elif [ -x /usr/bin/yaourt ]; then
		nb_aur=$(yaourt -Qua | grep "^aur/" | wc -l)
	else
		nb_aur=0
	fi

	nb_combined=$(($nb_pac + $nb_aur))
	if [[ \
	($nb_combined -gt 0 && $showon=="any") \
	|| ($nb_pac -gt 0 && $showon=="pacman") \
	|| ($nb_aur -gt 0 && $showon=="aur") \
	|| $showon=="always" \
	]]; then
		output="${format/$pac_sub/$nb_pac}"
		output="${output/$aur_sub/$nb_aur}"
		printf "${output/$combined_sub/$nb_combined}"
	else
		printf ""
	fi
}

main() {
	print_updates
}

main
