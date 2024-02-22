return {
	-- Gruvbox Material
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "medium" -- soft, medium, hard
			vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
			vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
			vim.g.gruvbox_material_statusline_style = "material"
			vim.g.gruvbox_material_cursor = "auto"

			vim.g.gruvbox_material_colors_override = { bg0 = "#000000" } -- #0e1010
			vim.g.gruvbox_material_colors_override = { bg0 = "#121212" }
			vim.g.gruvbox_material_better_performance = 1

			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	-- Jellybeans
	{
		"metalelf0/jellybeans-nvim",
		dependencies = { { "rktjmp/lush.nvim", version = false } },
		enabled = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("jellybeans-nvim")
		end,
	},
	-- Nordic
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("nordic")
		end,
	},
	-- Nightly
	{
		"Alexis12119/nightly.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("nightly")
		end,
	},
}
