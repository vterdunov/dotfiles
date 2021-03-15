export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="vterdunov"

plugins=(
   git
   autojump
   direnv
   kubectl
   helm
   docker
   docker-compose
   kube-ps1
)

source $ZSH/oh-my-zsh.sh

export WORDCHARS='~!#$%^&*(){}[]<>?.+;-_/\|=@`'
export HISTORY_IGNORE="(ls *|cd *|pwd|exit|j *)"
export HISTSIZE=100000
export SAVEHIST=100000
HIST_STAMPS="yyyy-mm-dd"
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export FD_OPTS='--follow --exclude .git --exclude node_modules'

export FZF_DEFAULT_COMMAND="fd --type f --color=never --hidden $FD_OPTS"
export FZF_DEFAULT_OPTS='--color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b --reverse'

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range :50 {}'"

export EDITOR="code -w"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export PATH=$PATH:/usr/local/go/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> .ssh/ssh-agent
   fi
   eval `cat .ssh/ssh-agent`
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit && compinit

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias bat='bat --color=always --style=plain --pager=never'
