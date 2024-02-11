#!/usr/bin/env zsh

. ~/.zshrc

while true; do
	vared -p "Query: " -c command
	cd ~/dev/projects/
	eval "$command"
  unset command
done
