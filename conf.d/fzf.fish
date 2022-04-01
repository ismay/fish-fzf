set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx FZF_CTRL_T_COMMAND "fd"
set -gx FZF_DEFAULT_OPTS "--color=16"

# set up fzf key bindings
_fzf_default_bindings

# enable ripgrep fuzzy find
bind \cf _fzf_rf
