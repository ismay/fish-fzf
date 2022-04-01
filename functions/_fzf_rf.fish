# Inspired by https://github.com/PatrickF1/fzf.fish/pull/118
function _fzf_rf
  # Use smart case and fixed strings for all searches
  set shared_rg_params --smart-case --fixed-strings

  set rg_command rg \
    # Show the total amount of matches per file
    --count \
    $shared_rg_params

  set fzf_command fzf \
    # Rerun ripgrep when the query changes
    --bind "change:reload:$rg_command {q} || true" \
    # Allow disabling the preview
    --bind 'ctrl-p:toggle-preview' \
    # Do not filter with fzf
    --disabled \
    # The standard delimiter for ripgrep
    --delimiter : \
    # Use ripgrep for the preview, show context around the match
    --preview="rg $shared_rg_params --line-number --color always --context 2 {q} {1}" \
    --layout=reverse

  set result ($rg_command '' | $fzf_command)

  if [ -n "$result" ]
    set results (string split : $result)
    commandline -i $results[1]
  end

  commandline -f repaint
end
