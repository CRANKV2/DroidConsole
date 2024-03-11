#!/system/bin/sh

# Call variables script
. $(pwd)/variables.sh

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

# Call the main function
misc