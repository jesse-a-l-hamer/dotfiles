---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>nh",
    function()
      Snacks.notifier.show_history()
    end,
    desc = "History",
  },
  {
    "<leader>nd",
    function()
      Snacks.notifier.hide()
    end,
    desc = "Dismiss",
  },
}
