---@module 'lazy'

return { ---@type LazyPluginSpec
  "folke/trouble.nvim",
  specs = {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<c-t>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
  },
  keys = {
    {
      "<leader>tD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace diagnostics",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer diagnostics",
    },
    {
      "<leader>tl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location list",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix list",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
      desc = "Symbols",
    },
    {
      "<leader>tL",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ...",
    },
  },
  opts = { ---@type trouble.Config
  },
}
