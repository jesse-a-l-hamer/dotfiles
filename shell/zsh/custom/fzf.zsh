# set fzf theme
# note: add the following if not using a transparent terminal:
# bg:#24273a,
# --color=selected-bg:#494d64 \
# bg+:#363a4f,
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--multi"

if [[ ! "$PATH" == */home/jessehamer/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jessehamer/.fzf/bin"
fi

source <(fzf --zsh)
