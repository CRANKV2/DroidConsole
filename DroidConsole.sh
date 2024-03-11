#!/system/bin/sh
# Author: NotZeetaa
# Version: BETA 1

# Variables
CONFIG=/data/adb/modules/DroidConsole/config.sh
S2=/sys/devices/system/cpu/cpufreq/schedutil
SC=/sys/devices/system/cpu/cpu0/cpufreq/schedutil
KGSL=/sys/class/kgsl/kgsl-3d0/
WINDOW=/data/system/users/0/settings_secure.xml

# Functions
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

gpu_throttling() {
    clear
    red
    animation_title
    echo "********************************"
    animation_title
    echo "      × GPU Throttling ×      "
    animation_title
    echo "********************************"
    green
    space
    animation
    echo "1 - Turn off throttling"
    red
    space
    animation
    echo "* NOTE * Turning off gpu throttling can lead to heat and maybe more dangeours situations * NOTE *"
    green
    space
    animation
    echo "2 - Turn on throttling"
    animation
    echo "3 - Go back"
    animation
    echo "4 - Main"
    animation
    echo "5 - Exit"
    reset
    space
    echo "Your input: "
    read gpu_throttling_input
    case $gpu_throttling_input in
        1)
            echo "0" > $KGSL/throttling
            sed -i '/^GPU_THROTTLING=/c\GPU_THROTTLING="0"' $CONFIG
            finish
            ;;
        2)
            echo "1" > $KGSL/throttling
            sed -i '/^GPU_THROTTLING=/c\GPU_THROTTLING="1"' $CONFIG
            finish
            ;;
        3)
            gpu
            ;;
        4)
            main
            ;;
        5)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
}

gpu() {
    clear
    red
    animation_title
    echo "*****************************"
    animation_title
    echo "      × GPU Tweaks ×      "
    animation_title
    echo "*****************************"
    green
    space
    animation
    echo "1 - GPU Throttling"
    animation
    echo "2 - Main"
    animation
    echo "3 - Exit"
    reset
    space
    echo "Your input: "
    read gpu_input
    case $gpu_input in
        1)
            gpu_throttling
            ;;
        2)
            main
            ;;
        3)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
}

cpu_iowait_boost() {
    clear
    red
    animation_title
    echo "********************************"
    animation_title
    echo "      × IO Wait Boost ×      "
    animation_title
    echo "********************************"
    green
    space
    animation
    echo "1 - Enable IO Wait Boost"
    animation
    echo "2 - Disable IO Wait Boost"
    animation
    echo "3 - Go back"
    animation
    echo "4 - Main"
    animation
    echo "5 - Exit"
    reset
    space
    echo "Your input: "
    read input
    case $input in
        1)
            if [ -d $S2 ]; then
                echo "1" > $S2/iowait_boost_enable
            elif [ -e $SC ]; then
                for cpu in /sys/devices/system/cpu/*/cpufreq/schedutil
                do
                    echo "1" > "${cpu}/iowait_boost_enable"
                done
            fi
            sed -i '/^IOWAIT_BOOST=/c\IOWAIT_BOOST="1"' $CONFIG
            finish
            cpu
            ;;
        2)
            if [ -d $S2 ]; then
                echo "0" > $S2/iowait_boost_enable
            elif [ -e $SC ]; then
                for cpu in /sys/devices/system/cpu/*/cpufreq/schedutil
                do
                    echo "0" > "${cpu}/iowait_boost_enable"
                done
            fi
            sed -i '/^IOWAIT_BOOST=/c\IOWAIT_BOOST="0"' $CONFIG
            finish
            cpu
            ;;
        3)
            cpu
            ;;
        4)
            main
            ;;
        5)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
}

cpu() {
    clear
    red
    animation_title
    echo "*****************************"
    animation_title
    echo "      × CPU Tweaks ×      "
    animation_title
    echo "*****************************"
    green
    space
    animation
    echo "1 - Schedutil rate limits"
    animation
    echo "2 - Iowait boost"
    animation
    echo "3 - Main"
    animation
    echo "4 - Exit"
    reset
    space
    echo "Your input: "
    read cpu_input
    case $cpu_input in
        1)
            if [ -d $S2 ]; then
                echo "500" > $S2/up_rate_limit_us
                echo "20000" > $S2/down_rate_limit_us
            elif [ -e $SC ]; then
                for cpu in /sys/devices/system/cpu/*/cpufreq/schedutil
                do
                    echo "500" > "${cpu}/up_rate_limit_us"
                    echo "20000" > "${cpu}/down_rate_limit_us"
                done
            fi
            sed -i '/^CPU_RATELIMITS=/c\CPU_RATELIMITS="1"' $CONFIG
            finish
            cpu
            ;;
        2)
            cpu_iowait_boost
            ;;
        3)
            main
            ;;
        4)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
    reset
}

ram() {
    clear
    red
    echo "*****************************"
    echo "      × RAM Tweaks ×      "
    echo "*****************************"
    reset
}

window_feature() {
    clear
    red
    animation_title
    echo "**********************************"
    animation_title
    echo "      × Window ignore secure ×      "
    animation_title
    echo "**********************************"
    green
    space
    animation
    echo "1 - Enable window ignore secure feature"
    animation
    echo "2 - Disable window ignore secure feature"
    animation
    echo "3 - Go back"
    animation
    echo "4 - Main"
    animation
    echo "5 - Exit"
    reset
    space
    echo "Your input: "
    read input
    case $input in
        1)
            if grep -q "window_ignore_secure" $WINDOW; then
                settings put secure window_ignore_secure "1"
            fi
            ;;
        2)
            if grep -q "window_ignore_secure" $WINDOW; then
                settings put secure window_ignore_secure "0"
            fi
            ;;
        3)
            misc
            ;;
        4)
            main
            ;;
        5)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
}

misc() {
    clear
    red
    animation_title
    echo "*****************************"
    animation_title
    echo "      × Miscellaneous ×      "
    animation_title
    echo "*****************************"
    green
    space
    animation
    echo "1 - Window ignore secure feature"
    animation
    echo "2 - Main"
    animation
    echo "3 - Exit"
    reset
    space
    echo "Your input: "
    read input
    case $input in
        1)
            window_feature
            ;;
        2)
            main
            ;;
        3)
            leave
            ;;
        *)
            red
            echo "Invalid input!"
            reset
            ;;
    esac
}

main() {
    clear
    echo -en "\e[40m\e[37m"
    red
    animation_title
    echo "*****************************"
    animation_title
    echo "      × DroidConsole ×      "
    animation_title
    echo "*****************************"
    green
    space
    animation
    echo "1 - CPU tweaks"
    animation
    echo "2 - GPU tweaks"
    animation
    echo "3 - RAM tweaks"
    animation
    echo "4 - Miscellaneous"
    animation
    echo "5 - Github"
    animation
    echo "6 - About"
    animation
    echo "7 - Donate"
    animation
    echo "8 - Exit"
    space
    reset
    echo "Your input: "
    read input
    case $input in
        1)
            cpu
            ;;
        2)
            gpu
            ;;
        3)
            ram
            ;;

        4)
            misc
            ;;
        5)
            clear
            blue
            animation
            echo "Our github link:"
            space
            animation
            echo "× https://github.com/NotZeetaa/DroidConsole ×"
            space
            animation
            echo "1 - Go back"
            animation
            echo "2 - Exit"
            reset
            space
            animation
            echo "Your input: "
            read input2
            if [ $input2 -eq "1" ]; then
                main
            elif [ $input2 -eq "2" ]; then
                leave
            fi
            reset
            ;;
        6)
            animation
            echo "******************************************************************************************************************************"
            animation
            echo "      × DroidConsole: An open-source Android terminal for tailoring and tweaking your device to suit your preferences. ×      "
            animation
            echo "******************************************************************************************************************************"
            green
            space
            animation
            echo "1 - Go back"
            animation
            echo "2 - Exit"
            reset
            space
            animation
            echo "Your input: "
            read input
            if [ $input -eq "1" ]; then
                main
            elif [ $input -eq "2" ]; then
                leave
            fi
            ;;
        7)
            am start -a android.intent.action.VIEW -d "http://notzeetaa.github.io/Donate-NotZeetaa"
            main
            ;;
        8)
            leave
            ;;
        *)
            echo "wrong"
            ;;
    esac
}

# Call the main function
main
