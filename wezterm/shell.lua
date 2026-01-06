local M = {}

function M.update_config(config)
  config.default_prog = {"/usr/bin/fish", "-l", "-c", "zellij attach -c"}
end

return M
