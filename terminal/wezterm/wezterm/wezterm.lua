-- Pull in the wezterm API
local wezterm = require("wezterm")

-- import helper configs
local theme = require("theme")
local tabline = require("tabline")

-- set basic configs
local function build_base_config()
	local config = wezterm.config_builder()

	-- This is where you actually apply your config choices

	config.enable_scroll_bar = true
	config.font = wezterm.font("MonaspiceAr Nerd Font Mono")

	config.max_fps = 144

	config.quick_select_alphabet = "arstqwfpzxcvneioluymdhgjbk"

	-- config.tab_bar_at_bottom = true

	config.window_frame = { -- sets title font
		font = wezterm.font("MonaspiceXe Nerd Font Propo"),
	}
	config.window_background_opacity = 0.80

	return config
end

local config = build_base_config()

theme.apply_to_config(config, "#ee99a0")
tabline.apply_to_config(config)

return config
