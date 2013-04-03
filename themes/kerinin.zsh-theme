# https://github.com/kerinin zsh theme

# set VIMODE according to the current mode (default “[i]”)
VIMODE='¶'
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/✈}/(main|viins)/¶}"
  zle reset-prompt
}

zle -N zle-keymap-select

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_UNMERGED="✂ "
ZSH_THEME_GIT_PROMPT_DELETED="✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="➜ "
ZSH_THEME_GIT_PROMPT_MODIFIED="✎ "
ZSH_THEME_GIT_PROMPT_ADDED="✚ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="? "

PROMPT='%{%f%k%b%}
%{%K{${bkg}}%B%F{green}%}%n on %{%B%F{blue}%}%{%B%F{cyan}%}%m%{%B%F{green}%} in %{%b%F{green}%K{${bkg}}%}%~%{%B%F{green}%} $(git_prompt_info) $(git_prompt_short_sha) $(git_prompt_status) $(git_prompt_ahead)%E%{%f%k%b%}
${VIMODE}%{%f%k%b%}  '

RPROMPT='$(date +"%A %B %d %I:%M:%S %p") !%{%B%F{cyan}%}%!%{%f%k%b%}'
