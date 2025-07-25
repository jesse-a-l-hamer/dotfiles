---@module 'lazy'
---@module 'snacks'
return { ---@type LazyKeysSpec[]
  {
    "<leader>tnf",
    function()
      Snacks.terminal.open(nil, { win = { position = "float" } })
    end,
    desc = "floating",
  },
  {
    "<leader>tnv",
    function()
      Snacks.terminal.open(nil, { win = { position = "right" } })
    end,
    desc = "vertical split",
  },
  {
    "<leader>tnh",
    function()
      Snacks.terminal.open(nil, { win = { position = "bottom" } })
    end,
    desc = "horizontal split",
  },
  {
    "<leader>tf",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "float" } })
    end,
    desc = "floating",
  },
  {
    "<leader>tv",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "right" } })
    end,
    desc = "vertical split",
  },
  {
    "<leader>th",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "bottom" } })
    end,
    desc = "horizontal split",
  },
}
