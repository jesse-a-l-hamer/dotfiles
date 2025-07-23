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
      "<leader>xD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[D]iagnostics",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[d]iagnostics (buffer)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "[l]ocation list",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[q]uickfix list",
    },
    {
      "<leader>lxs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[s]ymbols",
    },
    {
      "<leader>lxl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "[l]sp Definitions / references / ...",
    },
  },
  opts = { ---@type trouble.Config
  },
}
