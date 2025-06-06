local wezterm = require("wezterm")
local config = {}
--- Theme
config.color_scheme = "Catppuccin Mocha (Gogh)"

--- Window settings
config.window_padding = {
	left = 20,
	right = 20,
	bottom = 20,
	top = 20,
}
config.window_background_opacity = 0.9
config.enable_tab_bar = false

--- Font config
config.font_size = 13.0
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")

--- Plugins to load
-- local domains = wezterm.plugin.require("https://github.com/DavidRR-F/quick_domains.wezterm")
-- domains.apply_to_config(config)

return config
