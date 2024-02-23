start_info() {
    printf "  $(uname -s) $(uname -r) $(uname -m)\n  "
    date +%Y/%m/%d,\ %I:%M\ %p
}

alias clear="clear; start_info"
start_info
