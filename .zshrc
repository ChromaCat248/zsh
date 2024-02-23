# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# source files from zshrc.d
for scriptfile in ~/.config/zsh/zshrc.d/*
do
  if [[ $scriptfile = *.zsh ]]
  then
    source $scriptfile
  fi
done
