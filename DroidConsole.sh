#!/system/bin/sh
# Author: NotZeetaa
# Version: BETA 1

# Call variables script
. $(pwd)/variables.sh

# Variables
cpu() {
    . $(pwd)/cpu.sh
}

gpu() {
    . $(pwd)/gpu.sh
}

misc() {
    . $(pwd)/misc.sh
}

ram() {
    . $(pwd)/ram.sh
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
