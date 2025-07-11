---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>pc",
    function()
      Snacks.profiler.scratch()
    end,
    desc = "[c]onfigure profiler picker",
  },
}
