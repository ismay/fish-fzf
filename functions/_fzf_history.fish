function _fzf_history -d "Show command history"
    # history merge incorporates history changes from other fish sessions
    builtin history merge

    set fzf_command fzf \
        --height 40% \
        --reverse \
        --color=16

    set result (builtin history | $fzf_command | string collect)

    if [ -n "$result" ]
        commandline --replace -- $result
    end

    commandline -f repaint
end
