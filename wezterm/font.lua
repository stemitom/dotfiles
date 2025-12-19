local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
	config.line_height = 1.0
	config.cell_width = 0.85
	config.font = wezterm.font_with_fallback({
		{
			family = "CaskaydiaCove NFM",
			weight = "Regular",
		},
	})
	config.font_size = 10
end

return M
