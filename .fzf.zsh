# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vterdunov/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/vterdunov/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vterdunov/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vterdunov/.fzf/shell/key-bindings.zsh"
bindkey -r '^T'
# bindkey -r '^D'
bindkey '^F' fzf-file-widget
bindkey '^O' fzf-cd-widget
