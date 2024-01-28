#!/usr/bin/env bash

check_dependencies() {
	if ! command -v curl &>/dev/null; then
		exit 1
	fi
}

is_offline() {
	local RESPONSE=$(echo "$1" | jq -r ".data")

	if [ "$RESPONSE" = "[]" ]; then
		return 0
	else
		return 1
	fi
}

main() {

	check_dependencies

	local TOKEN="Authorization: Bearer mwmbrc0x7gzbaq8pm35yg2mrtckozr"
	local CLIENT_ID="Client-ID: 0hrjgp53439aqfw2gppjhrok3mk1fw"
	local URL="https://api.twitch.tv/helix/streams?user_login="
	local STREAMER=$1

	local RESPONSE=$(curl -s -H "$TOKEN" -H "$CLIENT_ID" "$URL$STREAMER")

	if is_offline "$RESPONSE"; then
		echo "#[fg=#636363,bg=#15161e,bold]  "
	else
		local USER_NAME=$(echo "$RESPONSE" | jq -r ".data[0].user_name")
		local GAME_NAME=$(echo "$RESPONSE" | jq -r ".data[0].game_name")
		echo "#[fg=#8d4cef,bg=#15161e,bold]  #[fg=#2b97fa,bg=#15161e,bold] $USER_NAME | $GAME_NAME"
	fi
}

main "$1"

INTERVAL="$(tmux show -g | grep status-interval | cut -d" " -f2 | bc)"
if [[ $INTERVAL < 30 ]]; then
	sleep 30
fi
