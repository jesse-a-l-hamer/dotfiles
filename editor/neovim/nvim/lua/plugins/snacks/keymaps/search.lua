---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>sl",
    function()
      Snacks.picker.lines()
    end,
    desc = "Lines in buffer",
  },
  {
    "<leader>sb",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "Open buffers",
  },
  {
    "<leader>ss",
    function()
      Snacks.picker.grep()
    end,
    desc = "Current working directory",
  },
  {
    "<leader>sw",
    function()
      Snacks.picker.grep_word()
    end,
    desc = "Current word (in cwd)",
    mode = { "n", "x" },
  },
}
