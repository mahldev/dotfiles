#!/usr/bin/env bash

RESET="#[fg=brightwhite,bg=#15161e,nobold,noitalics,nounderscore,nodim]"
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux set -g status-style bg=#1A1B26
tmux set -g status-right-length 150
tmux set -g status-interval 1

SCRIPTS_PATH="$CURRENT_DIR/src"
PANE_BASE="$(tmux show -g | grep pane-base-index | cut -d" " -f2 | bc)"

spotify_status="#($SCRIPTS_PATH/spotify-statusbar.sh)"
git_status="#($SCRIPTS_PATH/git-status.sh #{pane_current_path})"
wb_git_status="#($SCRIPTS_PATH/wb-git-status.sh #{pane_current_path} &)"
custom_pane="#($SCRIPTS_PATH/custom-number.sh #I -o)"
zoom_number="#($SCRIPTS_PATH/custom-number.sh #I -O)"
twitch_extension="#($SCRIPTS_PATH/twitch-extension.sh orslok &)"

tmux set -g status-left "#[fg=#15161e,bg=#2b97fa,bold] #{?client_prefix,󰠠 ,#[dim]󰤂 }#[nodim]#S $RESET"

tmux set -g pane-active-border-style "fg=#737aa2"
tmux set-option -g pane-border-style "fg=#292e42"
tmux set-option -g message-style "bg=#f7768e,fg=#16161e"

tmux set -g window-status-current-format "#[fg=#44dfaf,bg=#1F2335]   #[fg=#a9b1d6,bg=#1F2335]$custom_number #[bold,nodim]#W#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane} #{?window_last_flag,,} "
tmux set -g window-status-format "#[fg=#c0caf5,bg=default,none,dim]   $custom_number #W#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane}#[fg=yellow,blink] #{?window_last_flag,󰁯 ,} "

tmux set -g status-right "$spotify_status #[fg=#a9b1d6,bg=#24283B] %Y-%m-%d #[]❬ %H:%M $twitch_extension $git_status$wb_git_status"

tmux set -g window-status-separator ""
