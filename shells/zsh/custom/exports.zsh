# BEGIN: copied from oh-my-zsh .zshrc
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# END: copied from oh-my-zsh .zshrc

# aws-vault
export AWS_SESSION_TOKEN_TTL=12h

### BEGIN PATH EXPORTS ###

# cargo
export PATH="$HOME/.cargo/bin":$PATH

# flatpaks
export PATH="$HOME/.local/share/flatpak/exports/bin":$PATH

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

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


