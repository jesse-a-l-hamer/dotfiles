local wezterm = require("wezterm")

local M = {}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

function M.apply_to_config(config)
  tabline.setup({
    options = {
      theme = config.colors,
    },
  })

  tabline.apply_to_config(config)
end

return M
