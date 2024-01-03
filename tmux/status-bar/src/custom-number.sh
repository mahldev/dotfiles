#!/usr/bin/env bash

ID=$(($1))
FORMAT=$2

if [ "$FORMAT" = "-o" ]; then
	case $ID in
	0) echo "󰎣" ;;
	1) echo "󰎦" ;;
	2) echo "󰎩" ;;
	3) echo "󰎬" ;;
	4) echo "󰎮" ;;
	5) echo "󰎰" ;;
	6) echo "󰎵" ;;
	7) echo "󰎸" ;;
	8) echo "󰎻" ;;
	9) echo "󰎾" ;;
	*) echo $ID ;;
	esac
fi

if [ "$FORMAT" = "-O" ]; then
	case $ID in
	0) echo "󰎢" ;;
	1) echo "󰎥" ;;
	2) echo "󰎨" ;;
	3) echo "󰎫" ;;
	4) echo "󰎲" ;;
	5) echo "󰎯" ;;
	6) echo "󰎴" ;;
	7) echo "󰎷" ;;
	8) echo "󰎺" ;;
	9) echo "󰎽" ;;
	*) echo $ID ;;
	esac
fi
