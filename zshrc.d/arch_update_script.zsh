# update script for arch linux, requires reflector and paru
update() {
    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Arch/AUR packages  %F{255}%K{0}%F{7}"

    # saves to /etc/pacman.d/reflector-mirrorlist, to use these mirrors you can add
    # `Include = /etc/pacman.d/reflector-mirrorlist`
    # to /etc/pacman.d/mirrorlist
    print -P "%F{33}%K{0}%F{7} Updating mirrorlist using Reflector"
    sudo reflector -c us --save /etc/pacman.d/reflector-mirrorlist
    echo

    print -P "%F{33}%K{0}%F{7} Running paru -Syyu"
    paru -Syyu
    echo


    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Flatpak packages  %F{255}%K{0}%F{7}"
    flatpak update
    echo
}
