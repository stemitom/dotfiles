local M = {}

function M.update_config(config)
  config.default_prog = {"/opt/homebrew/bin/fish", "-l", "-c", "tmux attach || tmux"}
end

return M
