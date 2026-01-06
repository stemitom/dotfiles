local wezterm = require("wezterm")
local M = {}

function M.update_config(config)
	config.font = wezterm.font_with_fallback({
		{
			family = "OperatorMono Nerd Font",
			weight = "Regular",
		},
	})
	config.font_size = 10
end

return M
