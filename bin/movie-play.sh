#!/usr/bin/env bash
trap "finish" INT TERM
set -e
finish() {
    tput cnorm
    echo
    echo "SEEK=$FRAME"
    exit 0
}
FRAME=${SEEK:-0}
INPUT_DIR=$1
clear
tput civis
while true; do
    FRAME=$(((FRAME+1)))
    FRAME_RAW_FILE="${INPUT_DIR}/${FRAME}"
    if [[ ! -f "$FRAME_RAW_FILE" ]]; then
        FRAME=0
        continue
    fi
    tput cup 0 0
    cat "$FRAME_RAW_FILE"
    if [[ "$ONCE" == "1" ]]; then
        tput cnorm
        exit 0
    fi
    sleep "${SLEEP:-0.2}"
done
exit 0