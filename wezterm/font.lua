local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
	config.line_height = 1.4
	config.cell_width = 0.85
	config.font = wezterm.font_with_fallback({
		{
			family = "OperatorMono Nerd Font",
			weight = "Regular",
		},
	})
	config.font_size = 10.7
end

return M
