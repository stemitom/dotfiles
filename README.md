# Dotfiles

Personal configuration files for my development environment.

## Configurations Included

- **nvim**: Neovim configuration
- **wezterm**: WezTerm terminal emulator configuration
- **ghostty**: Ghostty terminal emulator configuration
- **tmux**: Tmux terminal multiplexer configuration
- **fish**: Fish shell configuration

## Setup

This repository uses an auto-sync system where your live configs (in `~/.config/` and `~/`) are the source of truth, and changes are automatically synced to this repo.

### How It Works

1. **Live configs are primary**: Edit your configs in their normal locations (`~/.config/nvim`, `~/.config/wezterm`, etc.)
2. **Automatic syncing**: A systemd timer runs hourly to sync changes from live configs to this repo
3. **Automatic commits**: If changes are detected, they're automatically committed and pushed

### Sync Script

The `sync-dotfiles.sh` script handles syncing:
- Copies configs from live locations to this repo
- Commits changes with timestamp
- Pushes to remote repository

### Systemd Timer

Auto-sync is configured via systemd user timer:
- **Service**: `~/.config/systemd/user/dotfiles-sync.service`
- **Timer**: `~/.config/systemd/user/dotfiles-sync.timer`
- **Frequency**: Every hour + 5 minutes after boot

### Manual Commands

```bash
# Run sync manually
./sync-dotfiles.sh

# Check timer status
systemctl --user status dotfiles-sync.timer

# Check service logs
journalctl --user -u dotfiles-sync.service

# Restart timer
systemctl --user restart dotfiles-sync.timer

# Disable auto-sync
systemctl --user stop dotfiles-sync.timer
systemctl --user disable dotfiles-sync.timer
```

## Installation on New Machine

```bash
# Clone this repo
git clone <repo-url> ~/workspace/personal/dotfiles
cd ~/workspace/personal/dotfiles

# Copy configs to their locations
rsync -av nvim/ ~/.config/nvim/
rsync -av wezterm/ ~/.config/wezterm/
rsync -av ghostty/ ~/.config/ghostty/
rsync -av fish/ ~/.config/fish/
cp tmux/.tmux.conf ~/.tmux.conf

# Set up auto-sync
cp ~/.config/systemd/user/dotfiles-sync.* ~/.config/systemd/user/ 2>/dev/null || true
systemctl --user daemon-reload
systemctl --user enable --now dotfiles-sync.timer
```

## Notes

- `fish_variables` is excluded (machine-specific)
- `.claude` directories in nvim and ghostty are excluded
- Timer runs hourly to minimize commit noise while keeping regular backups
