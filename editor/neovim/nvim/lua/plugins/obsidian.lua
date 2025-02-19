return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- HACK: to get completion working with blink.cmp instead of nvim-cmp
      -- note that this still requires nvim-cmp to be installed
      completion = {
        nvim_cmp = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/personal/notes/obsidian/",
        },
        {
          name = "work",
          path = "~/work/obsidian/",
        },
      },
      notes_subdir = "notes",
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        default_tags = { "daily-notes" },
        template = nil,
      },
      mappings = {
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>oc"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- smart action depending on context; either follow link or toggle checkbox
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      new_notes_location = "notes_subdir",
      ui = { enabled = false },  -- recommended for compatibility with render_markdown
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.compat" },
    opts = {
      sources = {
        default = { "obsidian", "obsidian_new", "obsidian_tags" },
        providers = {
          obsidian = {
            name = "obsidian",
            module = "blink.compat.source",
          },
          obsidian_new = {
            name = "obsidian_new",
            module = "blink.compat.source",
          },
          obsidian_tags = {
            name = "obsidian_tags",
            module = "blink.compat.source",
          },
        },
      },
    },
  },
}
