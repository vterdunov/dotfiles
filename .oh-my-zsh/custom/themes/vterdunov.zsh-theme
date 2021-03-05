DARK_BLUE="\033[0;36m"

br_name () {
  local name
  name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  if [[ -n $br_name ]]; then
    echo "->${name}"
  fi
}


PROMPT=$'%{$fg_bold[blue]%}┌─[%~]$(git_prompt_info)
%{$fg_bold[blue]%}└─[%{$fg_bold[green]%}$%{$fg_bold[blue]%}]%{$reset_color%} '
RPROMPT='%{$fg_bold[grey]%}[%*]%{$reset_color%}'
PS2=$' \e[0;34m%}%B>%{\e[0m%} '

ZSH_THEME_GIT_PROMPT_PREFIX="${DARK_BLUE}["
ZSH_THEME_GIT_PROMPT_SUFFIX="$(br_name)]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
