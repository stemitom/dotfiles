local M = {}

function M.update_config(config)
	config.color_schemes = {
		["Vesper"] = {
			background = "#101010",
			foreground = "#ffffff",
			cursor_bg = "#ffc799",
			cursor_fg = "#101010",
			cursor_border = "#ffc799",
			selection_bg = "#2a2a2a",
			selection_fg = "#ffffff",
			ansi = {
				"#101010", -- black
				"#ff8080", -- red
				"#99ffe4", -- green
				"#ffc799", -- yellow
				"#a0a0a0", -- blue
				"#ffc799", -- magenta
				"#99ffe4", -- cyan
				"#ffffff", -- white
			},
			brights = {
				"#505050", -- bright black
				"#ff9999", -- bright red
				"#b3ffe4", -- bright green
				"#ffd1a8", -- bright yellow
				"#b0b0b0", -- bright blue
				"#ffc799", -- bright magenta
				"#66ddcc", -- bright cyan
				"#ffffff", -- bright white
			},
		},
	}
	config.color_scheme = "Vesper"
end

return M
