#!/usr/bin/env bash

function check_dependencies() {
	if ! command -v playerctl &>/dev/null; then
		exit 1
	fi
}

function is_spotify_running() {
	pgrep -x "spotify" >/dev/null
}

# function get_playback_info() {
# 	local playing_status=$(playerctl -p spotify status)
# 	if [ "$playing_status" == "Playing" ]; then
# 		echo "♫ Playing"
# 	else
# 		echo "⏸ Paused"
# 	fi
# }

function format_time() {
	printf "%02d" $1
}

# function truncate_text() {
# 	local text=$1
# 	local max_length=$2
# 	if [ ${#text} -gt $max_length ]; then
# 		echo "${text:0:$max_length}..."
# 	else
# 		echo "$text"
# 	fi
# }

# function calculate_progress() {
# 	local duration=$1
# 	local position=$2
# 	local progress=$((position * 100 / duration))
# 	echo $progress
# }

function generate_progress_bar() {
	local progress=$1

	# local BG_COLOR="#24283B"
	# local ACCENT_COLOR="#0DD3BB"
	# local BG_BAR="#15161e"
	# local TIME_COLOR="#414868"

	local BG_COLOR="#24283B"
	local ACCENT_COLOR="#7db1c7"
	local BG_BAR="#15161e"
	local TIME_COLOR="#414868"

	local OUTPUT="$ARTIST - $SONG_TITLE"
	local TIME="[ $(format_time $CURRENT_MINUTES):$(format_time $CURRENT_SECONDS) / $(format_time $DURATION_MINUTES):$(format_time $DURATION_SECONDS) ]"

	if [ -z "$OUTPUT" ]; then
		echo "$OUTPUT #[fg=green,bg=default]"
	else
		OUT=" $OUTPUT $TIME "
		ONLY_OUT=" $OUTPUT "
		TIME_INDEX=${#ONLY_OUT}
		OUTPUT_LENGTH=${#OUT}
		PERCENT=$((CURRENT_POSITION_SECONDS * 100 / DURATION_MILISECONDS))
		PROGRESS=$((OUTPUT_LENGTH * PERCENT / 100))
		O=" $OUTPUT"

		if [ $PROGRESS -le $TIME_INDEX ]; then
			echo "#[nobold,fg=$BG_COLOR,bg=$ACCENT_COLOR]${O:0:$PROGRESS}#[fg=$ACCENT_COLOR,bg=$BG_BAR]${O:$PROGRESS:$TIME_INDEX} #[fg=$TIME_COLOR,bg=$BG_BAR]$TIME"
		else
			DIFF=$((PROGRESS - TIME_INDEX))
			echo "#[nobold,fg=$BG_COLOR,bg=$ACCENT_COLOR]${O:0:$TIME_INDEX} #[fg=$BG_BAR,bg=$ACCENT_COLOR]${OUT:$TIME_INDEX:$DIFF}#[fg=$TIME_COLOR,bg=$BG_BAR]${OUT:$PROGRESS}"
		fi
	fi
}

check_dependencies

if ! is_spotify_running; then
	exit 0
fi

ARTIST=$(playerctl -p spotify metadata artist)
SONG_TITLE=$(playerctl -p spotify metadata title)
DURATION_MILISECONDS=$(playerctl -p spotify metadata mpris:length | awk '{print int($1/1000000)}')
PLAYBACK_INFO=$(get_playback_info)

CURRENT_POSITION_SECONDS=$(playerctl -p spotify position | awk '{printf "%.0f", $1}')

DURATION_SECONDS=$((DURATION_MILISECONDS % 60))
DURATION_MINUTES=$((DURATION_MILISECONDS / 60))
DURATION_REMAINING_SECONDS=$((DURATION_SECONDS % 60))

CURRENT_MINUTES=$((CURRENT_POSITION_SECONDS / 60))
CURRENT_SECONDS=$((CURRENT_POSITION_SECONDS % 60))

generate_progress_bar
