---@module 'snacks'

local filter_snacks_picker_win = function(win, source_type)
  local pickers = Snacks.picker.get { source = source_type }
  local picker_wins = vim.fn.flatten(
    vim.tbl_map(function(p)
      local window_ids = {}
      for _, w in pairs(p.layout.wins) do
        if w.win then
          table.insert(window_ids, w.win)
        end
      end
      return window_ids
    end, pickers),
    1
  )

  local is_correct_source = (type(picker_wins) == "table" and vim.tbl_contains(picker_wins, win) or false)
  local is_not_floating = vim.api.nvim_win_get_config(win).relative == ""

  return is_correct_source and is_not_floating
end

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  keys = {
    {
      "<leader>E",
      function()
        require("edgy").toggle()
      end,
      desc = "[E]dgy",
    },
  },
  ---@module 'edgy'
  opts = { ---@type Edgy.Config
    top = {},
    bottom = {
      {
        title = "Diagnostics",
        ft = "trouble",
        pinned = true,
        collapsed = true,
        open = "Trouble diagnostics toggle",
      },
      {
        title = "Help",
        ft = "help",
        filter = function(buf, _)
          return vim.bo[buf].buftype == "help"
        end,
      },
      {
        ft = "snacks_terminal",
        size = { height = 0.4 },
        title = "Terminal",
        filter = function(_, win)
          return vim.w[win].snacks_win
            and vim.w[win].snacks_win.position == "bottom"
            and vim.w[win].snacks_win.relative == "editor"
            and not vim.w[win].trouble_preview
        end,
        pinned = true,
        collapsed = true,
        open = function()
          Snacks.terminal()
        end,
      },
    },
    left = {
      {
        title = "Explorer",
        ft = "snacks_layout_box",
        size = { height = 0.5 },
        pinned = true,
        open = function()
          Snacks.explorer()
        end,
        filter = function(_, win)
          return filter_snacks_picker_win(win, "explorer")
        end,
      },
      {
        title = "Buffers",
        ft = "snacks_layout_box",
        pinned = true,
        collapsed = true,
        open = function()
          Snacks.picker.buffers {
            layout = { preset = "sidebar", preview = "main" },
          }
        end,
        filter = function(_, win)
          return filter_snacks_picker_win(win, "buffers")
        end,
      },
      {
        title = "Git Status",
        ft = "snacks_layout_box",
        pinned = true,
        collapsed = true,
        open = function()
          Snacks.picker.git_status {
            layout = { preset = "sidebar", preview = nil },
          }
        end,
        filter = function(_, win)
          return filter_snacks_picker_win(win, "git_status")
        end,
      },
    },
    right = {
      {
        title = function()
          local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
          return vim.fn.fnamemodify(buf_name, ":t")
        end,
        ft = "trouble",
        pinned = true,
        collapsed = true,
        open = "Trouble symbols toggle",
        size = { height = 0.5 },
      },
    },
    animate = { enabled = false },
    close_when_all_hidden = false,
  },
}
