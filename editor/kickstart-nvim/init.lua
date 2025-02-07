-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- set Python provider environment, if found
-- vim.g.python3_host_prog = "$HOME/python_venvs/neovim-nightly/.venv/bin/python3"
local neovim_python = "$HOME/python_venvs/neovim-nightly/.venv/bin/python3"
if vim.fn.filereadable(vim.fn.expand(neovim_python)) then
  vim.g.python3_host_prog = neovim_python
end

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
