function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\*(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{255}'
COLOR_DIR=$'%F{255}'
COLOR_GIT=$'%F{255}'
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}${parse_git_branch}${COLOR_DEF} $ '
export EDITOR='nvim'

source $HOME/.zsh/aliases
