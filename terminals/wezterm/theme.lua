local wezterm = require("wezterm")

local M = {}

local function override_catppuccin_macchiato_accent(accent_color)
  local custom_scheme = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]
  -- set custom overrides here
  custom_scheme.tab_bar.active_tab.bg_color = accent_color
  return {
    color_schemes = {
      ["Catppuccin Macchiato (Custom Accent)"] = custom_scheme,
    },
    color_scheme = "Catppuccin Macchiato (Custom Accent)",
  }
end

local function tableMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

function M.apply_to_config(config, accent_color)
  config = tableMerge(config, override_catppuccin_macchiato_accent(accent_color))
end

return M
