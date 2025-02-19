if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
  return {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    config = function(_, opts)
      vim.g.firenvim_config = {
        globalSettings = {},
        localSettings = {
          [".*"] = {
            cmdline = "none",
            takeover = "always",
          },
        },
      }
      -- keybinding to toggle focus back to page:
      vim.api.nvim_set_keymap("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<CR>", { desc = "Focus page" })

      -- automatically sync buffer and page element, throttling to improve performance
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
        callback = function(e)
          if vim.g.timer_started == true then
            return
          end
          vim.g.timer_started = true
          vim.fn.timer_start(10000, function()
            vim.g.timer_started = false
            vim.cmd "silent write"
          end)
        end,
      })

      return opts
    end,
  }
else
  vim.o.laststatus = 2
  return {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    lazy = true,
  }
end
