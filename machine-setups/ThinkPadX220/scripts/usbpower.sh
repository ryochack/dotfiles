#!/usr/bin/env bash
set -eu
#
# https://www.kernel.org/doc/Documentation/usb/power-management.txt
#

USB_DEVICE_COUNTS=$(lsusb -t | grep -oe "Bus [0-9]\+" | wc -l)

fn_help() {
	cat << __EOS__
Usage: usbpower COMMAND [USB_DEV_NO]

Commands:
	ls      list usb device poewr states
	on      resume USB device and NOT allow autosuspend
	auto    allow autoresume and autosuspend USB device
	help    show this usage

__EOS__
}

fn_ls() {
	USB_DEVICE_NUMBER_LIST=($(seq ${USB_DEVICE_COUNTS}))

	if [ $# -gt 0 ]; then
        VAR=$(($1))
		if [ ${VAR} -ge 1 ] && [ ${VAR} -le ${USB_DEVICE_COUNTS} ]; then
			USB_DEVICE_NUMBER_LIST=($1)
		else
			echo "Invalid USB Device Number: $1"
			exit
		fi
	fi

	for USB_MINOR_NUMBER in "${USB_DEVICE_NUMBER_LIST[@]}"
	do

		USB_POW_PATH="/sys/bus/usb/devices/usb${USB_MINOR_NUMBER}/power"

		ACTIVE_DURATION=$(cat "${USB_POW_PATH}"/active_duration)
		ASYNC=$(cat "${USB_POW_PATH}"/async)
		AUTOSUSPEND=$(cat "${USB_POW_PATH}"/autosuspend)
		AUTOSUSPEND_DELAY_MS=$(cat "${USB_POW_PATH}"/autosuspend_delay_ms)
		CONNECTED_DURATION=$(cat "${USB_POW_PATH}"/connected_duration)
		CONTROL=$(cat "${USB_POW_PATH}"/control)
		LEVEL=$(cat "${USB_POW_PATH}"/level)
		RUNTIME_ACTIVE_KIDS=$(cat "${USB_POW_PATH}"/runtime_active_kids)
		RUNTIME_ACTIVE_TIME=$(cat "${USB_POW_PATH}"/runtime_active_time)
		RUNTIME_ENABLED=$(cat "${USB_POW_PATH}"/runtime_enabled)
		RUNTIME_STATUS=$(cat "${USB_POW_PATH}"/runtime_status)
		RUNTIME_SUSPENDED_TIME=$(cat "${USB_POW_PATH}"/runtime_suspended_time)
		RUNTIME_USAGE=$(cat "${USB_POW_PATH}"/runtime_usage)
		WAKEUP=$(cat "${USB_POW_PATH}"/wakeup)
		WAKEUP_ABORT_COUNT=$(cat "${USB_POW_PATH}"/wakeup_abort_count)
		WAKEUP_ACTIVE=$(cat "${USB_POW_PATH}"/wakeup_active)
		WAKEUP_ACTIVE_COUNT=$(cat "${USB_POW_PATH}"/wakeup_active_count)
		WAKEUP_COUNT=$(cat "${USB_POW_PATH}"/wakeup_count)
		WAKEUP_EXPIRE_COUNT=$(cat "${USB_POW_PATH}"/wakeup_expire_count)
		WAKEUP_LAST_TIME_MS=$(cat "${USB_POW_PATH}"/wakeup_last_time_ms)
		WAKEUP_MAX_TIME_MS=$(cat "${USB_POW_PATH}"/wakeup_max_time_ms)
		WAKEUP_PREVENT_SLEEP_TIME_MS=$(cat "${USB_POW_PATH}"/wakeup_prevent_sleep_time_ms)
		WAKEUP_TOTAL_TIME_MS=$(cat "${USB_POW_PATH}"/wakeup_total_time_ms)

		cat << __EOS__
USB${USB_MINOR_NUMBER}
	active_duration             : ${ACTIVE_DURATION}
	async                       : ${ASYNC}
	autosuspend                 : ${AUTOSUSPEND}
	autosuspend_delay_ms        : ${AUTOSUSPEND_DELAY_MS}
	connected_duration          : ${CONNECTED_DURATION}
	control                     : ${CONTROL}
	level (DEPRECATED)          : ${LEVEL}
	runtime_active_kids         : ${RUNTIME_ACTIVE_KIDS}
	runtime_active_time         : ${RUNTIME_ACTIVE_TIME}
	runtime_enabled             : ${RUNTIME_ENABLED}
	runtime_status              : ${RUNTIME_STATUS}
	runtime_suspended_time      : ${RUNTIME_SUSPENDED_TIME}
	runtime_usage               : ${RUNTIME_USAGE}
	wakeup                      : ${WAKEUP}
	wakeup_abort_count          : ${WAKEUP_ABORT_COUNT}
	wakeup_active               : ${WAKEUP_ACTIVE}
	wakeup_active_count         : ${WAKEUP_ACTIVE_COUNT}
	wakeup_count                : ${WAKEUP_COUNT}
	wakeup_expire_count         : ${WAKEUP_EXPIRE_COUNT}
	wakeup_last_time_ms         : ${WAKEUP_LAST_TIME_MS}
	wakeup_max_time_ms          : ${WAKEUP_MAX_TIME_MS}
	wakeup_prevent_sleep_time_ms: ${WAKEUP_PREVENT_SLEEP_TIME_MS}
	wakeup_total_time_ms        : ${WAKEUP_TOTAL_TIME_MS}
__EOS__

	done
}

fn_control() {
	USB_DEVICE_NUMBER_LIST=($(seq ${USB_DEVICE_COUNTS}))

	USB_POW_CONTROL=$1

	if [ $# -gt 1 ]; then
        VAR=$(($2))
		if [ ${VAR} -ge 1 ] && [ ${VAR} -le ${USB_DEVICE_COUNTS} ]; then
			USB_DEVICE_NUMBER_LIST=($2)
		else
			echo "Invalid USB Device Number: $1"
			exit
		fi
	fi

	for USB_MINOR_NUMBER in "${USB_DEVICE_NUMBER_LIST[@]}"
	do
		USB_POW_PATH="/sys/bus/usb/devices/usb${USB_MINOR_NUMBER}/power"
		USB_POW_CONTROL_DEV="${USB_POW_PATH}/control"
		# echo "${USB_POW_CONTROL}" > "${USB_POW_CONTROL_DEV}"
		echo "${USB_POW_CONTROL}" | sudo tee "${USB_POW_CONTROL_DEV}" > /dev/null
	done
}

if [ $# -eq 0 ]; then
	fn_ls
	exit
fi

case $1 in
	"ls" ) fn_ls "${@:2}" ;;
	[1-${USB_DEVICE_COUNTS}] ) fn_ls "$1" ;;

	# resume USB device and NOT allow autosuspend
	"on" ) fn_control on "${@:2}" ;;
	# allow autoresume and autosuspend USB device
	"auto" ) fn_control auto "${@:2}" ;;

	"help" ) fn_help ;;
	* ) echo "Invalid command: $1"
		fn_help
		;;
esac

