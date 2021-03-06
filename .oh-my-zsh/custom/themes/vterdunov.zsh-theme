KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_DEFAULT=⎈
KUBE_PS1_SEPARATOR=''
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''
KUBE_PS1_DIVIDER=''
KUBE_PS1_CTX_COLOR=23
KUBE_PS1_SYMBOL_COLOR=23

_br_name () {
  local name
  name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  if [[ -n $name ]]; then
    echo -n "->${name}"
  fi
}

_git() {
  if [[ -d .git ]]; then
    echo "%F{23}[$(git_current_branch)$(_br_name)]"
  fi
}

_k8s_context() {
  echo "%F{23}[$(kube_ps1)%F{23}]"
}

_ret_status() {
  echo "%(?.%F{2}$.%F{1}$)"
}

_clock() {
  echo "%F{244}[%*]"
}


PROMPT=$'%F{4}┌─[%~]$(_git)$(_k8s_context)
%F{4}└─[$(_ret_status)%F{4}]%F{15} '
RPROMPT="$(_clock)"
PS2=$' \e[0;34m%}%B>%{\e[0m%} '
