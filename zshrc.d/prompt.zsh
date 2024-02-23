# Powerline symbols:
#          

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
