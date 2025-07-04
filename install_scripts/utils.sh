# Collection of common utility functions for shell scripting.

# PRINT STATUS UPDATES
ARROW='  '
FAIL='     '
WARN='     '
INFORM='     '
SUCCESS='     '

print_messages() {
    MESSAGE_TYPE=$1
    shift

    case $(echo $MESSAGE_TYPE | tr '[:upper:]' '[:lower:]') in
    f)
        PREFIX="$FAIL$ARROW "
        ;;
    w)
        PREFIX="$WARN$ARROW "
        ;;
    i)
        PREFIX="$INFORM$ARROW "
        ;;
    s)
        PREFIX="$SUCCESS$ARROW "
        ;;
    *)
        PREFIX=""
        ;;
    esac

    for MESSAGE in "$@"; do
        echo "$PREFIX$MESSAGE"
    done
}

fail() {
    EXIT_CODE=$1
    shift

    print_messages f "$@"

    echo "Aborting."
    exit $EXIT_CODE
}

cleanup_then_fail() {
    CLEANUP_FUNC=$1
    NUM_CLEANUP_STEPS=$2
    EXIT_CODE=$3

    shift
    shift
    shift

    eval $CLEANUP_FUNC $NUM_CLEANUP_STEPS

    fail $EXIT_CODE "$@"

}

warn() {
    print_messages w "$@"
}

inform() {
    print_messages i "$@"
}

success() {
    print_messages s "$@"
}

# CHECK FOR ROOT PRIVILEGES
check_root() {
    if [ "$1" -ne 0 ]; then
        fail 1 "Please run script with root privileges."
    fi
}

# GET CONSENT
get_consent() {
    CONSENT=""
    print_messages "$@"
    while :; do
        echo "[y/N]?"
        read CONSENT
        case $CONSENT in
        y)
            return 1
            ;;
        N)
            return 2
            ;;
        *)
            echo "Invalid input: $CONSENT"
            ;;
        esac
    done
}
