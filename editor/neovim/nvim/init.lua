-- Set <space> as the leader key
-- See `:help mapleader`
--(neovim_python)  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- enable Snakcs.profiler on startup
if vim.env.PROF then
  local snacks = vim.fn.stdpath "data" .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup {
    startup = {
      event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  }
end

-- set Python provider environment, if found
-- vim.g.python3_host_prog = "$HOME/python_venvs/neovim-nightly/.venv/bin/python3"
local neovim_python = vim.fn.expand "$HOME/envs/python/neovim/.venv/bin/python3"
if vim.fn.filereadable(neovim_python) then
  vim.g.python3_host_prog = neovim_python
end

-- add custom filetypes
vim.filetype.add {
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
}

-- [[ Setting options ]]
require "options"

-- [[ Basic Keymaps ]]
require "keymaps"

-- [[ Install `lazy.nvim` plugin manager ]]
require "lazy-bootstrap"

-- [[ Configure and install plugins ]]
require "lazy-plugins"

-- [[ Configure LSPs ]]
require "lsp"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
