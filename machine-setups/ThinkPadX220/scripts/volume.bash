#!/usr/bin/env bash

set -eu

function fn_help() {
	cat << __EOS__
Usage: volume COMMAND [OPTION...]

Commands:
	mute     mute sound volume
	unmute   unmute sound volume
	get      get current sound volume
	set [%]  set sound volume
	help     show this usage

__EOS__
}

function fn_mute() {
	pamixer -m
}

function fn_unmute() {
	pamixer -u
}

function fn_get_volume() {
	if [[ $(pamixer --get-mute) = "true" ]] ; then
		echo "mute"
	else
        echo "$(pamixer --get-volume)%"
	fi
}

function fn_set_volume() {
    if [[ $# -lt 1 ]]; then
        echo "set requires volume[%] value"
        exit
    fi
	pamixer --set-volume "$1"
}

if [ $# -eq 0 ]; then
	fn_get_volume
	exit
fi

case $1 in
	"mute" ) fn_mute ;;
	"unmute" ) fn_unmute ;;
	"get" ) fn_get_volume ;;
	"set" ) fn_set_volume "${@:2}" ;;
	"help" ) fn_help ;;
	* ) echo "Invalid command: $1"
		fn_help
		;;
esac

