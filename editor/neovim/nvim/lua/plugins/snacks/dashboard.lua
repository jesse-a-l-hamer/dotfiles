---@module 'snacks'
return { ---@type snacks.dashboard.Config
  preset = {
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "s", desc = "Search Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = " ", key = "S", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "g", desc = "Lazygit", action = ":lua Snacks.lazygit()" },
      { icon = " ", key = "G", desc = "Github", action = ":lua Snacks.gitbrowse()" },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
  sections = {
    { section = "header", padding = 1 },
    {
      section = "terminal",
      cmd = "colorscript -e fade",
      height = 5,
      padding = 1,
    },
    { section = "keys", gap = 1, padding = 1 },
    { section = "startup" },
    {
      section = "terminal",
      cmd = "colorscript -e colorwheel",
      height = 7,
      padding = 1,
      indent = 23,
    },
  },
}
