# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# source files from zshrc.d
for scriptfile in $ZDOTDIR/zshrc.d/*
do
  if [[ $scriptfile = *.zsh ]]
  then
    source $scriptfile
  fi
done

# environment variables file
if [ -e $ZDOTDIR/env.zsh ]
then
  source $ZDOTDIR/env.zsh
fi
