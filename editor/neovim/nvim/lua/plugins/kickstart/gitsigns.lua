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
        end, { desc = "Next git [h]unk/change" })

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal { "[h", bang = true }
          else
            ---@diagnostic disable-next-line: param-type-mismatch
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "Previous git [h]unk/change" })

        -- Actions
        -- visual mode
        map("v", "<leader>gsh", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "[h]unk" })
        map("v", "<leader>grh", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "[h]unk" })
        -- normal mode
        map("n", "<leader>gsh", gitsigns.stage_hunk, { desc = "[h]unk" })
        map("n", "<leader>grh", gitsigns.reset_hunk, { desc = "[h]unk" })
        map("n", "<leader>gsb", gitsigns.stage_buffer, { desc = "[b]uffer" })
        map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[u]ndo stage hunk" })
        map("n", "<leader>grb", gitsigns.reset_buffer, { desc = "[b]uffer" })
        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[p]review hunk" })
        map("n", "<leader>gdi", gitsigns.diffthis, { desc = "against [i]ndex" })
        map("n", "<leader>gdc", function()
          gitsigns.diffthis "@"
        end, { desc = "against last [c]ommit" })
        -- Toggles
        map("n", "<leader>gD", gitsigns.toggle_deleted, { desc = "toggle show [D]eleted" })
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
