KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_DEFAULT=⎈
KUBE_PS1_SEPARATOR=''
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''
KUBE_PS1_DIVIDER=''
KUBE_PS1_CTX_COLOR=23
KUBE_PS1_SYMBOL_COLOR=23


setopt promptsubst
setopt promptpercent

__br_name () {
  local name
  name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  if [[ -n $name ]]; then
    echo -n "->${name}"
  fi
}

__git() {
  if [[ -d .git ]]; then
    echo -n "%F{23}[$(git_current_branch)$(__br_name)]%f"
  fi
}

__k8s_context() {
  echo "%F{23}[$(kube_ps1)%F{23}]"
}

__ret_status() {
  echo "%(?.%F{2}$.%F{1}$)"
}

__clock() {
  echo "[%*]"
}


PROMPT='%F{4}┌─[%~]$(__git)$(__k8s_context)
%F{4}└─[$(__ret_status)%F{4}]%f '
RPROMPT='%F{244}$(__clock)%f'
PS2=$' \e[0;34m%}%B>%{\e[0m%} '
