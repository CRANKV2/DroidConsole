#!/system/bin/sh

# Variables
CONFIG=/data/adb/modules/DroidConsole/config.sh
S2=/sys/devices/system/cpu/cpufreq/schedutil
SC=/sys/devices/system/cpu/cpu0/cpufreq/schedutil
KGSL=/sys/class/kgsl/kgsl-3d0/
WINDOW=/data/system/users/0/settings_secure.xml

red() {
    echo -en "\e[31m"
}

green() {
    echo -en "\e[32m"
}

yellow() {
    echo -en "\e[33m"
}

blue() {
    echo -en "\e[34m"
}

pink() {
    echo -en "\e[35m"
}

reset() {
    echo -en "\e[0m"
}

space() {
    echo ""
}

animation_title() {
    sleep 0.2
}

animation() {
    sleep 0.1
}

main() {
    . $(pwd)/DroidConsole.sh
}

finish() {
    clear
    pink
    echo "Applying it..."
    sleep 1.5
    clear
    yellow
    animation
    echo "**********************"
    animation
    echo "      × Done ×      "
    animation
    echo "**********************"
    space
    blue
    echo "Redirecting..."
    sleep 2
    main
}

leave() {
    clear
    pink
    space
    animation
    echo "**************************************************"
    animation
    echo "      × Thank you for using DroidConsole! ×      "
    animation
    echo "**************************************************"
    space
    reset
    exit 0
}