return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				cmdline = {
					view = "cmdline",
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
		},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- filename
	{
		"b0o/incline.nvim",
		opts = {},
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},

	-- zen mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- dashboard title
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[
  █     █░ ▄▄▄        ██████  ██▓███      ██▓▒██   ██▒
▓█░ █ ░█░▒████▄    ▒██    ▒ ▓██░  ██▒   ▓██▒▒▒ █ █ ▒░
▒█░ █ ░█ ▒██  ▀█▄  ░ ▓██▄   ▓██░ ██▓▒   ▒██▒░░  █   ░
░█░ █ ░█ ░██▄▄▄▄██   ▒   ██▒▒██▄█▓▒ ▒   ░██░ ░ █ █ ▒ 
░░██▒██▓  ▓█   ▓██▒▒██████▒▒▒██▒ ░  ░   ░██░▒██▒ ▒██▒
░ ▓░▒ ▒   ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░   ░▓  ▒▒ ░ ░▓ ░
  ▒ ░ ░    ▒   ▒▒ ░░ ░▒  ░ ░░▒ ░         ▒ ░░░   ░▒ ░
  ░   ░    ░   ▒   ░  ░  ░  ░░           ▒ ░ ░    ░  
    ░          ░  ░      ░               ░   ░    ░  
                                                          ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
