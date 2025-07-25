---@module 'lazy'
---@module 'snacks'
return { ---@type LazyKeysSpec[]
  {
    "<leader>.nf",
    function()
      Snacks.terminal.open(nil, { win = { position = "float" } })
    end,
    desc = "floating",
  },
  {
    "<leader>.nv",
    function()
      Snacks.terminal.open(nil, { win = { position = "right" } })
    end,
    desc = "vertical split",
  },
  {
    "<leader>.nh",
    function()
      Snacks.terminal.open(nil, { win = { position = "bottom" } })
    end,
    desc = "horizontal split",
  },
  {
    "<leader>.f",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "float" } })
    end,
    desc = "floating",
  },
  {
    "<leader>.v",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "right" } })
    end,
    desc = "vertical split",
  },
  {
    "<leader>.h",
    function()
      Snacks.terminal.toggle(nil, { win = { position = "bottom" } })
    end,
    desc = "horizontal split",
  },
}
