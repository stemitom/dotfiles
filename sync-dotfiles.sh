#!/bin/bash

# Dotfiles sync script
# Syncs live configs to the dotfiles repo and commits/pushes changes

DOTFILES_DIR="/home/sam/workspace/personal/dotfiles"
cd "$DOTFILES_DIR" || exit 1

# Function to sync a config
sync_config() {
    local source="$1"
    local dest="$2"
    local exclude_args="${3:-}"

    if [ -d "$source" ]; then
        echo "Syncing $source -> $dest"
        rsync -a --delete $exclude_args "$source/" "$dest/"
    elif [ -f "$source" ]; then
        echo "Copying $source -> $dest"
        cp "$source" "$dest"
    else
        echo "Warning: $source not found"
    fi
}

echo "=== Dotfiles Sync Started at $(date) ==="

# Sync nvim config (exclude .claude directory)
sync_config "$HOME/.config/nvim" "$DOTFILES_DIR/nvim" "--exclude='.claude'"

# Sync wezterm config
sync_config "$HOME/.config/wezterm" "$DOTFILES_DIR/wezterm"

# Sync ghostty config (exclude .claude directory)
sync_config "$HOME/.config/ghostty" "$DOTFILES_DIR/ghostty" "--exclude='.claude'"

# Sync tmux config
sync_config "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"

# Sync fish config (exclude fish_variables as it's machine-specific)
sync_config "$HOME/.config/fish" "$DOTFILES_DIR/fish" "--exclude='fish_variables'"

# Check if there are any changes
if [[ -n $(git status --porcelain) ]]; then
    echo "Changes detected, committing..."

    # Add all changes
    git add -A

    # Create commit with timestamp
    COMMIT_MSG="Auto-sync dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MSG"

    # Push to remote
    echo "Pushing to remote..."
    git push origin main

    echo "=== Sync completed with changes ==="
else
    echo "=== No changes detected ==="
fi

echo "Finished at $(date)"
