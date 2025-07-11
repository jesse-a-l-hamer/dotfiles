---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>nh",
    function()
      Snacks.notifier.show_history()
    end,
    desc = "[h]istory",
  },
  {
    "<leader>nd",
    function()
      Snacks.notifier.hide()
    end,
    desc = "[d]ismiss",
  },
}
