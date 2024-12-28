# aws-vault
export AWS_SESSION_TOKEN_TTL=12h

### BEGIN PATH EXPORTS ###

# cargo
export PATH='/home/jessehamer/.cargo/bin':$PATH

# flatpaks
export PATH='/home/jessehamer/.local/share/flatpak/exports/bin':$PATH

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

### END PATH EXPORTS ###

# uv
export UV_PYTHON=$HOME/.local/share/uv/python/cpython-3.12.7-linux-x86_64-gnu/bin/python

# bat
export BAT_THEME="Catppuccin Macchiato"

# fzf
# note: add the following if not using a transparent terminal:
# bg:#24273a,
# --color=selected-bg:#494d64 \
# bg+:#363a4f,
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--multi"
