local M = {}

function M.update_config(config)
	-- config.default_prog = {"/usr/bin/fish", "-l", "-c", "zellij attach -c"}
	config.default_prog = { "/usr/bin/fish", "-l", "-c", "tmux new -A -s wezterm" }
end

return M
