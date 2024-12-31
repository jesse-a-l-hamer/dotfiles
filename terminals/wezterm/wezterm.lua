-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local function build_config()
  local config = wezterm.config_builder()

  -- This is where you actually apply your config choices

  config.enable_scroll_bar = true
  config.font = wezterm.font("MonaspiceAr NFM")

  config.max_fps = 144

  config.quick_select_alphabet = "arstqwfpzxcvneioluymdhgjbk"

  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false

  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.window_frame = {
    font = wezterm.font("MonaspiceAr NFP"),
  }
  config.window_background_opacity = 0.75

  return config
end

local catppuccin_macchiato_maroon = "#ee99a0"
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

-- and finally, return the configuration to wezterm
return tableMerge(build_config(), override_catppuccin_macchiato_accent(catppuccin_macchiato_maroon))
