#
# ~/.zshrc
#

# Powerline symbols:
#          

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "%K{41}%F{0}  %b %F{41}"

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%F{45}%K{0}╭─%F{0}%K{45} %B>_%b /bin/zsh %F{45}${vcs_info_msg_0_}%K{51}%F{0}   %~ %F{51}%K{0}
%F{45}%K{0}╰─%F{159} %n %F{51}>%F{39}>%F{33}>%F{255} '
#RPROMPT='%F{33}%K{0}%F{39}%K{33}%F{45}%K{39}%F{0}%K{45} %? '

setopt autocd

start_info() {
    printf "  $(uname -s) $(uname -r) $(uname -m)\n  "
    date +%Y/%m/%d,\ %I:%M\ %p
}
start_info
alias clear="clear; start_info"

#shopt -s autocd
#shopt -s cdspell

alias ls='exa --long'

alias fpk="flatpak"
alias fpki="flatpak install"
alias fpku="flatpak uninstall"
alias fpkr="flatpak update" #'r' stands for "refresh"
alias fpks="flatpak search"

update() { # made for arch linux, requires reflector and paru
    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Refreshing Pacman mirrorlist  %F{255}%K{0}%F{7}"
    sudo reflector -c us --save /etc/pacman.d/mirrorlist
    echo

    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Arch packages  %F{255}%K{0}%F{7}"
    paru -Syyu
    echo

    print -P "%F{51}%K{39}%F{39}%K{33}%F{33}%K{255}%F{0}  Updating Flatpaks  %F{255}%K{0}%F{7}"
    flatpak update
    echo
}
