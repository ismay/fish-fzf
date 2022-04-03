set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx FZF_CTRL_T_COMMAND "fd"
set -gx FZF_DEFAULT_OPTS "--color=16"

# set up fzf key bindings
bind \cf _fzf_ripgrep
bind \cr _fzf_history
bind \ct _fzf_file
bind \ec _fzf_cd
