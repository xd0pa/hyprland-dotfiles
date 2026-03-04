#!/bin/bash

# Script para control de brillo con barra visual en SwayNC

get_brightness() {
    brightnessctl g
}

get_max_brightness() {
    brightnessctl m
}

get_brightness_percentage() {
    local current=$(get_brightness)
    local max=$(get_max_brightness)
    echo $((current * 100 / max))
}

send_notification() {
    local brightness=$(get_brightness_percentage)

    if [ $brightness -eq 0 ]; then
        notify-send -u low -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness -A "dismiss" "Brightness" ""
    elif [ $brightness -lt 30 ]; then
        notify-send -u low -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness -A "dismiss" "Brightness" ""
    elif [ $brightness -lt 70 ]; then
        notify-send -u low -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness -A "dismiss" " Brightness" ""
    else
        notify-send -u low -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness -A "dismiss" " Brightness" ""
    fi
}

send_notification() {
    local brightness=$(get_brightness_percentage)

    if [ $brightness -eq 0 ]; then
        notify-send -u low -t 1000 -h int:transient:1 -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness "Brightness" ""
    elif [ $brightness -lt 30 ]; then
        notify-send -u low -t 1000 -h int:transient:1 -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness "Brightness" ""
    elif [ $brightness -lt 70 ]; then
        notify-send -u low -t 1000 -h int:transient:1 -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness "Brightness" ""
    else
        notify-send -u low -t 1000 -h int:transient:1 -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:$brightness "Brightness" ""
    fi
}

case $1 in
    up)
        brightnessctl s 2%+
        send_notification
        ;;
    down)
        brightnessctl s 2%-
        send_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
