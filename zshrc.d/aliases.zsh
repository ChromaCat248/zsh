# flatpak shorthand
alias fpk="flatpak"
alias fpki="flatpak install"
alias fpkr="flatpak uninstall" # flatpak 'R'emove
alias fpku="flatpak update"
alias fpks="flatpak search"
alias fpkx="flatpak run" #flatpak e'X'ecute

# fancy ls
alias ls="eza -l"

# vim muscle memory
alias :q="exit"
:e() {
  if [[ $EDITOR ]] then $EDITOR $@
  else echo Environment variable \$EDITOR is not set
  fi
}
