function _fzf_ripgrep
    set shared_rg_params --smart-case --fixed-strings

    set rg_command rg \
        --count \
        $shared_rg_params
    set fzf_command fzf \
        --color=16 \
        --bind "change:reload:$rg_command {q} || true" \
        --disabled \
        --delimiter : \
        --preview="rg $shared_rg_params --line-number --color always --context 2 {q} {1}" \
        --layout=reverse

    set result ($rg_command '' | $fzf_command)

    if test -n "$result"
        set results (string split : $result)
        commandline -i $results[1]
    end

    commandline -f repaint
end
