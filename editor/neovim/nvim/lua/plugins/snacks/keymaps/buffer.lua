---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>St",
    function()
      Snacks.scratch()
    end,
    desc = "Toggle scratch buffer",
  },
  {
    "<leader>Sl",
    function()
      Snacks.scratch.select()
    end,
    desc = "Open scratch buffer from list",
  },
}
