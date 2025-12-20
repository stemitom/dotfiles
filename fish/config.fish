# ============================================
# Abbreviations
# ============================================
abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a cl 'clear'
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
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

# ============================================
# File listing (eza or fallback to ls)
# ============================================
if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza'
	abbr -a ll 'eza -l'
	abbr -a lll 'eza -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# ============================================
# Tmux auto-start
# ============================================
if status --is-interactive
	switch $TERM
		case 'linux'
			# Don't start tmux in Linux console
		case '*'
			if ! set -q TMUX
				exec tmux set-option -g default-shell (which fish) ';' new-session
			end
	end
end

# ============================================
# Autojump integration
# ============================================
if test -f /usr/share/autojump/autojump.fish
	source /usr/share/autojump/autojump.fish
end

# ============================================
# Environment Variables
# ============================================
set -gx PGUSER postgres
set -gx PGPASSWORD postgres
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx BUN_INSTALL "$HOME/.bun"

# FZF settings
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow'
set -gx FZF_CTRL_T_COMMAND 'fd --type file --follow'
set -gx FZF_DEFAULT_OPTS '--height 20%'

# Colored man pages
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# ============================================
# PATH modifications
# ============================================
if not string match -q -- $PNPM_HOME $PATH
	set -gx PATH $PNPM_HOME $PATH
end
set -gx PATH $BUN_INSTALL/bin $PATH

# ============================================
# Git prompt settings
# ============================================
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# ============================================
# Functions
# ============================================

# Navigate to git repository root
function d --description "Navigate to git repository root"
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

# Merge files by extension
function mf --description "Merge all files with given extensions"
	if test (count $argv) -eq 0
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
		echo ""
		cat $file
		echo ""
		echo ""
	end
end

# Universal clipboard helper
function clip --description "Copy stdin to clipboard (auto-detect system)"
	if command -v xclip > /dev/null
		xclip -selection clipboard
	else if command -v xsel > /dev/null
		xsel --clipboard
	else if command -v pbcopy > /dev/null
		pbcopy
	else if command -v clip.exe > /dev/null
		clip.exe
	else
		echo "Error: No clipboard command found"
		return 1
	end
end

# ============================================
# Key bindings
# ============================================
function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

# ============================================
# Prompt
# ============================================
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (command -q hostname; and hostname; or hostnamectl hostname)
	if [ $PWD != $HOME ]
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

# ============================================
# Greeting
# ============================================
function fish_greeting
	set_color brblack
	echo "╭─────────────────────────────────────────╮"
	set_color normal
	
	# System info
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
	echo (uname -n)
	
	# Disk usage
	echo ""
	set_color yellow
	echo "  💾 Disk Usage"
	set_color normal
	df -h | grep -E 'dev/(xvda|sd|mapper|nvme|disk)' | awk '{
		usage = int($5)
		color = ""
		if (usage >= 85) color = "\\033[0;31m"
		else if (usage >= 75) color = "\\033[0;33m"
		else color = "\\033[0;32m"
		printf "     %s%-20s %s / %s  %s%s\\033[0m\n", color, $6, $3, $2, color, $5
	}'
	
	# Network info
	if command -q ip
		echo ""
		set_color magenta
		echo "  🌐 Network"
		set_color normal
		ip -4 addr show up scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | while read -l ip
			set iface (ip -4 addr show | grep -B 2 $ip | head -n 1 | awk '{print $2}' | sed 's/://')
			echo "     $iface → $ip"
		end
	end
	
	# TODOs
	if test -s ~/todo
		echo ""
		set_color red
		echo "  📝 TODOs"
		set_color yellow
		cat ~/todo | sed 's/^/     /'
	end
	
	echo ""
	set_color brblack
	echo "╰─────────────────────────────────────────╯"
	set_color normal
	echo ""
end

# ============================================
# Tool initialization (keep at end)
# ============================================
# fnm (Fast Node Manager)
if command -v fnm > /dev/null
	fnm env | source
end
zoxide init fish | source

# opencode
fish_add_path /home/sam/.opencode/bin
