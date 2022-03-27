# ensure fzf respects gitignored files
set -x FZF_DEFAULT_COMMAND "fd --type f"
set -x FZF_CTRL_T_COMMAND "fd"

# set 16 color colorscheme
set -x FZF_DEFAULT_OPTS "--color=16"

# set up fzf key bindings
fzf_key_bindings

# enable ripgrep fuzzy find
bind \cf rf
