-- [[ Configure and install plugins ]]
require("lazy").setup({
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  require "plugins.kickstart.gitsigns",
  require "plugins.kickstart.which-key",
  require "plugins.kickstart.lspconfig",
  require "plugins.kickstart.conform",
  require "plugins.kickstart.todo-comments",
  require "plugins.kickstart.mini",
  require "plugins.kickstart.treesitter",
  require "plugins.kickstart.debug",
  require "plugins.kickstart.lint",
  require "plugins.kickstart.autopairs",
  { import = "plugins" },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
    border = "rounded",
  },
})

-- vim: ts=2 sts=2 sw=2 et
