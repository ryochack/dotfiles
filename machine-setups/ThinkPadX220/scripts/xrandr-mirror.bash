#!/usr/bin/env bash

# This script is to set xrandr as mirroring

set -eu

DEBUG_ON=0

function log_output() {
    if [[ $DEBUG_ON -ne 1 || $# -eq 0 ]]; then
        return
    fi
    echo "$@"
}

function log_arr_output() {
    if [[ $DEBUG_ON -ne 1 || $# -eq 0 ]]; then
        return
    fi

    local i=0
    local arr=($@)
    for e in ${arr[@]}; do
        echo "[$i] ${e}"
        i=$((++i))
    done
}

# look for common resulution from resolution array parameter
# [in]: array of display resolution parameters
#       eg: ("1920x1080 1680x1050 1280x1024" "1600x1200 1280x1024 1280x960" "1920x1200 1600x1200 1680x1050 1280x1024")
# [out]: common resolution of given resolution parameters
#       eg: "1280x1024", if not found common_resolution, return ""
function find_common_resolution() {
    if [[ $# -eq 0 ]]; then
        echo ""
        return
    fi
    local reso_arr=($@)
    local arr_len=${#reso_arr[@]}

    if [[ $arr_len -eq 0 ]]; then
        :
    elif [[ $arr_len -eq 1 ]]; then
        COMMON_RESO=$(awk '{printf($1)}' <<< ${reso_arr[0]})
    else
        local IFS_BKUP=$IFS
        IFS=$' '
        for reso_primary in ${reso_arr[0]}; do
            local _not_found=0
            for ((i=1; i<arr_len; i++)); do
                if [[ ! "${reso_arr[$i]}" =~ $reso_primary ]]; then
                    _not_found=1
                    break
                fi
            done
            if [[ _not_found -eq 0 ]]; then
                COMMON_RESO=$reso_primary
                break;
            fi
        done
        IFS=$IFS_BKUP
    fi
}

XRANDR_STATUS=$(xrandr)
declare -a CONN_VOUTS
declare -a DISCONN_VOUTS

log_output "${XRANDR_STATUS}"
log_output ---

declare -A VOUT_RESOLUTIONS
CURRENT_VOUT=""

# parse xrandr output to get output-list and each resolutions
DEFAULT_IFS=$IFS
IFS=$'\n'
for line in ${XRANDR_STATUS}; do
    if [[ "$line" =~ disconnected ]]; then
        CURRENT_VOUT=""
        DISCONN_VOUTS+=("$(awk '/^\S.*\<disconnected\>/{printf("%s", $1)}' <<< $line)")
        continue
    elif [[ "$line" =~ connected ]]; then
        CURRENT_VOUT=$(awk '/^\S.*\<connected\>/{printf("%s", $1)}' <<< $line)
        CONN_VOUTS+=("${CURRENT_VOUT}")
        log_output "->" ${CURRENT_VOUT}
        continue
    fi

    if [[ ${CURRENT_VOUT} == "" ]]; then
        continue
    fi
    if [[ "$line" =~ ([0-9]+x[0-9]+) ]]; then
        RESO=${BASH_REMATCH[1]}
        VOUT_RESOLUTIONS[${CURRENT_VOUT}]+="${RESO} "
    fi
done

log_output "__connected_vouts__"
log_arr_output ${CONN_VOUTS[@]}
log_output "__disconnected_vouts__"
log_arr_output ${DISCONN_VOUTS[@]}

# push array from hashmap to pass find_common_resolution()
declare -a RESOS_ARRAY
for key in "${!VOUT_RESOLUTIONS[@]}"; do
    RESOS_ARRAY+=("${VOUT_RESOLUTIONS[$key]}")
done
log_output "__resolutions__"
log_arr_output ${RESOS_ARRAY[@]}

COMMON_RESO=""
find_common_resolution ${RESOS_ARRAY[@]}
if [[ $COMMON_RESO == "" ]]; then
    echo "not found common resolution"
    exit 0
fi

# xrandr --output eDP --mode 1280x1024 --rotate normal
#  --output DisplayPort-3 --mode 1280x1024 --rotate normal --same-as eDP
#  --output DisplayPort-4 --mode 1280x1024 --rotate normal --same-as eDP
#  --output HDMI-A-0 --off
#  --output DisplayPort-1 --off
#  --output DisplayPort-2 --off

PRIMARY_VOUT="${CONN_VOUTS[0]}"
XRANDR_ARGS=" --output ${PRIMARY_VOUT} --mode $COMMON_RESO --rotate normal"

for ((i=1; i<${#CONN_VOUTS[@]}; i++)); do
    XRANDR_ARGS+=" --output ${CONN_VOUTS[$i]} --mode $COMMON_RESO --rotate normal --same-as ${PRIMARY_VOUT}"
done
for ((i=0; i<${#DISCONN_VOUTS[@]}; i++)); do
    XRANDR_ARGS+=" --output ${DISCONN_VOUTS[$i]} --off"
done
log_output "$XRANDR_ARGS"

IFS=$DEFAULT_IFS

xrandr ${XRANDR_ARGS}

echo $COMMON_RESO

