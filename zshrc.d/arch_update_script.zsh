update() { # made for arch linux, requires reflector and paru
    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Refreshing Pacman mirrorlist  %F{255}%K{0}%F{7}"
    sudo reflector -c us --save /etc/pacman.d/mirrorlist
    echo

    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Arch packages  %F{255}%K{0}%F{7}"
    paru -Syyu
    echo

    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Flatpak packages  %F{255}%K{0}%F{7}"
    flatpak update
    echo
}
