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
zstyle ':vcs_info:git*' formats "%K{41}%F{0}  %b %F{41}"

precmd() { vcs_info }

setopt prompt_subst
PROMPT='%F{0}%K{45}  %n %F{45}${vcs_info_msg_0_}%K{51}%F{0} %~ %F{51}%K{39}%F{39}%K{33}%F{33}%K{0} %F{255}'
RPROMPT='%F{33}%K{0}%F{39}%K{33}%F{45}%K{39}%F{0}%K{45} %? '

setopt autocd

get_os()
{
    if [[ "$(uname -s)" == "Darwin" ]]; then
        IFS=$'\n' read -d "" -ra sw_vers <<< "$(awk -F'<|>' '/key|string/ {print $3}' \
                            "/System/Library/CoreServices/SystemVersion.plist")"
        for ((i=0;i<${#sw_vers[@]};i+=2)) {
            case ${sw_vers[i]} in
                ProductName)          darwin_name=${sw_vers[i+1]} ;;
                ProductVersion)       osx_version=${sw_vers[i+1]} ;;
                ProductBuildVersion)  osx_build=${sw_vers[i+1]}   ;;
            esac
        }
    fi

    case $(uname -s) in
        Darwin)   printf "$darwin_name" ;;
        SunOS)    printf "Solaris" ;;
        Haiku)    printf "Haiku" ;;
        MINIX)    printf "MINIX" ;;
        AIX)      printf "AIX" ;;
        IRIX*)    printf "IRIX" ;;
        FreeMiNT) printf "FreeMiNT" ;;

        Linux|GNU*)
            source /etc/os-release
            printf "$PRETTY_NAME"
        ;;

        *BSD|DragonFly|Bitrig)
            printf "BSD"
        ;;

        CYGWIN*|MSYS*|MINGW*)
            printf "Windows"
        ;;

        *)
            printf '%s\n' "Unknown OS" >&2
        ;;
    esac

    return $os
}

start_info() {
    printf "\e[1;36m  $(get_os)\e[38;5;255m, $(uname -s) $(uname -r) $(uname -m)\n  "
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
alias fpks="flatpak search"

update() {
    printf "\e[38;5;199m\e[48;5;201m\e[38;5;201m\e[48;5;165m\e[38;5;165m\e[48;5;129m\e[38;5;129m\e[48;5;255m\e[30m  Refreshing Pacman mirrorlist  \e[48;5;0m\e[38;5;255m\e[38;5;255m\n"
    sudo reflector -c us --save /etc/pacman.d/mirrorlist
    echo

    printf "\e[38;5;199m\e[48;5;201m\e[38;5;201m\e[48;5;165m\e[38;5;165m\e[48;5;129m\e[38;5;129m\e[48;5;255m\e[30m  Updating Arch packages  \e[48;5;0m\e[38;5;255m\e[38;5;255m\n"
    paru -Syyu
    echo

    printf "\e[38;5;199m\e[48;5;201m\e[38;5;201m\e[48;5;165m\e[38;5;165m\e[48;5;129m\e[38;5;129m\e[48;5;255m\e[30m  Updating Flatpaks  \e[48;5;0m\e[38;5;255m\e[38;5;255m\n"
    flatpak update
    echo
}

