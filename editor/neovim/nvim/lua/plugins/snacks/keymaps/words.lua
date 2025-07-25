---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "]]",
    function()
      Snacks.words.jump(vim.v.count1, true)
    end,
    desc = "Next Reference",
    mode = { "n", "t" },
  },
  {
    "[[",
    function()
      Snacks.words.jump(-vim.v.count1, true)
    end,
    desc = "Prev Reference",
    mode = { "n", "t" },
  },
}
