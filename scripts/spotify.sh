#!/bin/bash

get_spotify_song_linux() {
    playerctl -p spotify_player metadata --format "{{ artist }} - {{ title }}"
}

if pgrep -x "spotify_player" > /dev/null; then
    song=$(get_spotify_song_linux)

    if [[ -n "$song" ]]; then
        if [ ${#song} -gt 30 ]; then
            song="${song:0:30}..."
        fi
        echo "$song"
    else
        echo "Paused."
    fi
else
    echo "Spotify is not running."
fi
