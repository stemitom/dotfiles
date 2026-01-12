# ============================================
# Abbreviations
# ============================================
abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a cl clear
abbr -a ct 'cargo t'
abbr -a gobu 'go build'
abbr -a goft 'go fmt'
abbr -a gor 'go run'
abbr -a got 'go test'
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open
abbr -a g git
abbr -a gst 'git status'
abbr -a gc 'git commit -v'
abbr -a gco 'git checkout'
abbr -a ga 'git add -p'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a vimdiff 'nvim -d'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+4)'

if command -v eza > /dev/null
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l ls
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

# ============================================
# Auto-start multiplexers
# ============================================
if status --is-interactive
    if set -q ALACRITTY_SOCKET; and not set -q TMUX
        exec tmux new-session -A -s main
    else if test "$TERM_PROGRAM" = "ghostty"; and not set -q ZELLIJ
        exec zellij attach --create main
    end
end

# ============================================
# Environment
# ============================================
set -gx PGUSER postgres
set -gx PGPASSWORD postgres
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx BUN_INSTALL "$HOME/.bun"

set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow'
set -gx FZF_CTRL_T_COMMAND 'fd --type file --follow'
set -gx FZF_DEFAULT_OPTS '--height 21%'

set -gx LESS_TERMCAP_mb \e'[02;31m'
set -gx LESS_TERMCAP_md \e'[02;38;5;74m'
set -gx LESS_TERMCAP_me \e'[1m'
set -gx LESS_TERMCAP_se \e'[1m'
set -gx LESS_TERMCAP_so \e'[39;5;246m'
set -gx LESS_TERMCAP_ue \e'[1m'
set -gx LESS_TERMCAP_us \e'[05;38;5;146m'

fish_add_path ~/.local/bin
fish_add_path $PNPM_HOME
fish_add_path $BUN_INSTALL/bin
fish_add_path ~/.opencode/bin

# ============================================
# Git prompt
# ============================================
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 4

# ============================================
# Functions
# ============================================
function d --description "Navigate to git repository root"
    while test $PWD != "/"
        if test -d .git
            break
        end
        cd ..
    end
end

function mf --description "Merge all files with given extensions"
    if test (count $argv) -lt 1
        echo "Usage: mf <ext1> [ext2] [ext3] ..."
        echo "Example: mf go js py"
        echo "To copy: mf go | clip"
        return 1
    end
    
    set find_args
    for ext in $argv
        set find_args $find_args -name "*.$ext" -o
    end
    set find_args $find_args[1..-2]
    
    for file in (find . -type f \( $find_args \) | sort)
        echo "# ========================================="
        echo "# File: $file"
        echo "# ========================================="
        echo
        cat $file
        echo
        echo
    end
end

function clip --description "Copy stdin to clipboard"
    if command -v xclip > /dev/null
        xclip -selection clipboard
    else if command -v xsel > /dev/null
        xsel --clipboard
    else if command -v pbcopy > /dev/null
        pbcopy
    else if command -v clip.exe > /dev/null
        clip.exe
    else
        echo "Error: No clipboard command found" >&2
        return 1
    end
end

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end

function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color blue
    echo -n (hostname)
    if test $PWD != $HOME
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

function fish_greeting
    set_color brblack
    echo "╭─────────────────────────────────────────╮"
    set_color normal
    
    set_color cyan
    echo -n "  OS       "
    set_color normal
    echo (uname -ro)
    
    set_color cyan
    echo -n "  Uptime   "
    set_color normal
    echo (uptime | sed 's/^.*up  *\([^,]*\),.*/\1/')
    
    set_color cyan
    echo -n "  Hostname "
    set_color normal
    echo (hostname)
    
    echo
    set_color yellow
    echo "  💾 Disk Usage"
    set_color normal
    df -h | grep -E 'dev/(xvda|sd|mapper|nvme|disk)' | awk '{
        usage = int($5)
        color = ""
        if (usage >= 86) color = "\033[0;31m"
        else if (usage >= 76) color = "\033[0;33m"
        else color = "\033[0;32m"
        printf "     %s%-19s %s / %s  %s%s\033[0m\n", color, $6, $3, $2, color, $5
    }'
    
    if command -q ip
        echo
        set_color magenta
        echo "  🌐 Network"
        set_color normal
        ip -4 addr show up scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | while read -l addr
            set iface (ip -4 addr show | grep -B 2 $addr | head -n 1 | awk '{print $2}' | sed 's/://')
            echo "     $iface → $addr"
        end
    end
    
    if test -s ~/todo
        echo
        set_color red
        echo "  📝 TODOs"
        set_color yellow
        cat ~/todo | sed 's/^/     /'
    end
    
    echo
    set_color brblack
    echo "╰─────────────────────────────────────────╯"
    set_color normal
    echo
end

# ============================================
# Tool initialization
# ============================================
test -f /usr/share/autojump/autojump.fish; and source /usr/share/autojump/autojump.fish
command -v fnm > /dev/null; and fnm env | source
zoxide init fish | source
