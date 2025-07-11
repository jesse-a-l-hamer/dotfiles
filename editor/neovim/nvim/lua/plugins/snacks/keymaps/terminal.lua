---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>tt",
    function()
      Snacks.terminal()
    end,
    desc = "[t]oggle",
  },
}
