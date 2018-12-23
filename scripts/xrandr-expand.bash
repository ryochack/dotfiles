#!/usr/bin/env bash

# from: https://wiki.archlinux.jp/index.php/Xrandr#.E4.BE.8B_3a

set -eu

CMD="xrandr"
declare -A VOUTS
eval VOUTS=$(xrandr | awk 'BEGIN {printf("(")} /^\S.*connected/{printf("[%s]=%s ", $1, $2)} END{printf(")")}')
declare -A POS
#XPOS=0
#YPOS=0
#POS="${XPOS}x${YPOS}"

POS=([X]=0 [Y]=0)

#for key in "${!VOUTS[@]}"; do
#    echo $key "->" ${VOUTS[$key]}
#done

find_mode() {
    echo $(xrandr | grep ${1} -A1 | awk '{FS="[ x]"} /^\s/{printf("WIDTH=%s\nHEIGHT=%s", $4,$5)}')
}

xrandr_params_for() {
    if [ "${2}" == 'connected' ]
    then
        eval $(find_mode ${1})  #sets ${WIDTH} and ${HEIGHT}
        MODE="${WIDTH}x${HEIGHT}"
        CMD="${CMD} --output ${1} --mode ${MODE} --pos ${POS[X]}x${POS[Y]}"
        POS[X]=$((${POS[X]}+${WIDTH}))
    else
        CMD="${CMD} --output ${1} --off"
    fi
}

for VOUT in ${!VOUTS[*]}; do
    xrandr_params_for ${VOUT} ${VOUTS[${VOUT}]}
done

set -x
${CMD}
set +x
