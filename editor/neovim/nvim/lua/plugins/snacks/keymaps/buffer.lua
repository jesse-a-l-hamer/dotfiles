---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>bs",
    function()
      Snacks.scratch()
    end,
    desc = "[s]cratch",
  },
  {
    "<leader>bS",
    function()
      Snacks.scratch.select()
    end,
    desc = "[S]elect scratch",
  },
  {
    "<leader>bd",
    function()
      Snacks.bufdelete()
    end,
    desc = "[d]elete",
  },
}
