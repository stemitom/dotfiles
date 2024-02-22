return {
	{
		"mrcjkb/rustaceanvim",
		version = "^3", -- Recommended
		ft = { "rust" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.rustaceanvim = {
				-- inlay_hints = {}, -- use lsp-inlayhints.nvim in dependences
				tools = {
					hover_actions = {
						replace_builtin_hover = false,
					},
				},
				server = { -- use lsp-inlayhints.nvim in dependencies
					-- on_attach = function(client, bufnr)
					-- 	require("lsp-inlayhints").on_attach(client, bufnr)
					-- end,
				},
			}
		end,
	},
	-- crates
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		lazy = true,
		ft = { "rust", "toml" },
		event = { "BufRead", "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				-- null_ls = {
				--   enabled = true,
				--   name = "crates.nvim",
				-- },
				popup = {
					border = "none",
				},
			})
		end,
	},
}
