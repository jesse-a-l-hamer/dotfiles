---@module 'gitsigns'
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = { ---@type Gitsigns.config
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal { "]h", bang = true }
          else
            ---@diagnostic disable-next-line: param-type-mismatch
            gitsigns.nav_hunk "next"
          end
        end, { desc = "Next git hunk/change" })

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal { "[h", bang = true }
          else
            ---@diagnostic disable-next-line: param-type-mismatch
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "Previous git hunk/change" })

        -- Actions
        -- visual mode
        map("v", "<leader>gsh", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Hunk" })
        map("v", "<leader>grh", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Hunk" })
        -- normal mode
        map("n", "<leader>gsh", gitsigns.stage_hunk, { desc = "Hunk" })
        map("n", "<leader>grh", gitsigns.reset_hunk, { desc = "Hunk" })
        map("n", "<leader>gsb", gitsigns.stage_buffer, { desc = "Buffer" })
        map("n", "<leader>gu", gitsigns.stage_hunk, { desc = "Unstage hunk" })
        map("n", "<leader>grb", gitsigns.reset_buffer, { desc = "Buffer" })
        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gdi", gitsigns.diffthis, { desc = "Against index" })
        map("n", "<leader>gdc", function()
          gitsigns.diffthis "@"
        end, { desc = "Against last commit" })
        -- Toggles
        map("n", "<leader>gD", gitsigns.preview_hunk_inline, { desc = "Toggle show deleted" })
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
