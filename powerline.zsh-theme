# FreeAgent puts the powerline style in zsh !
# baked by AquarHEAD

REPO_DIRTY_COLOR=$FG[133]
REPO_CLEAN_COLOR=$FG[118]
REPO_PROMPT_INFO=$FG[012]

ZSH_THEME_REPO_PROMPT_PREFIX="::"
ZSH_THEME_REPO_PROMPT_SUFFIX="%{$REPO_PROMPT_INFO%}"
ZSH_THEME_REPO_PROMPT_DIRTY=" %{$REPO_DIRTY_COLOR%}✘"
ZSH_THEME_REPO_PROMPT_CLEAN=" %{$REPO_CLEAN_COLOR%}✔"

ZSH_THEME_REPO_PROMPT_ADDED="%{$FG[082]%} N%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_MODIFIED="%{$FG[166]%} M%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_DELETED="%{$FG[160]%} D%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_MISSING="%{$FG[160]%} ??%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_RENAMED="%{$FG[220]%} R%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_UNMERGED="%{$FG[082]%} UM%{$reset_color%}"
ZSH_THEME_REPO_PROMPT_UNTRACKED="%{$FG[190]%} UT%{$reset_color%}"

autoload colors zsh/terminfo
colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done

function repo_prompt_info() {
  local branch=""
  [ -n "$(git rev-parse --git-dir 2>/dev/null)" ] && branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ ! -z ${branch} ]; then
    echo "$ZSH_THEME_REPO_PROMPT_PREFIX${branch}$(repo_clean_dirty)$ZSH_THEME_REPO_PROMPT_SUFFIX"
  fi
}

function repo_clean_dirty() {
  if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
    echo "$ZSH_THEME_REPO_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_REPO_PROMPT_CLEAN"
  fi
}

function repo_prompt_status() {
  STATUS=""
  INDEX=$(git status --porcelain 2> /dev/null)
  if [ $INDEX ]; then
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_UNTRACKED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^A' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_ADDED$STATUS"
    elif $(echo "$INDEX" | grep '^M' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_ADDED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_MODIFIED$STATUS"
    elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_MODIFIED$STATUS"
    elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_MODIFIED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_RENAMED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^D ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_DELETED$STATUS"
    elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_DELETED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
      STATUS="$ZSH_THEME_REPO_PROMPT_UNMERGED$STATUS"
    fi
  fi
  echo $STATUS
}

function _prompt_indicator() {
  echo -n '◊'
}

function _custom_username() {
  [ -n $ZSH_USERNAME ] && echo $ZSH_USERNAME && return
  echo %n
}

# virtualenv support (for ESI development only)
function _venv_info() {
  echo "-ESI-"
}

# combined environment info
function _env_info() {
  if [ $VIRTUAL_ENV ]; then
    echo "$(_venv_info)"
  else
    echo "$(rvm-prompt)"
  fi
}

PROMPT='%(?..%{$fg[red]%}↪︎  %? ↩︎)
'%{$bg[green]%}%{$fg[black]%}' $(_custom_username) '%{$reset_color%}%{$bg[white]%}%{$fg[black]%}' $(_env_info) '%{$reset_color%}%{$fg[green]%}%{$bg[blue]%}%{$reset_color%}%{$fg[white]%}%{$bg[blue]%}' '%~$'$(repo_prompt_info) '%{$reset_color%}%{$fg[blue]%}$' $(repo_prompt_status)\n%{$fg_bold[white]%}$(_prompt_indicator) %{$reset_color%}'

RPROMPT=''
