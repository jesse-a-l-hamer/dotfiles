---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>sl",
    function()
      Snacks.picker.lines()
    end,
    desc = "[l]ines in buffer",
  },
  {
    "<leader>sb",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "[b]uffers",
  },
  {
    "<leader>sg",
    function()
      Snacks.picker.grep()
    end,
    desc = "[g]rep",
  },
  {
    "<leader>sw",
    function()
      Snacks.picker.grep_word()
    end,
    desc = "[w]ord",
    mode = { "n", "x" },
  },
}
