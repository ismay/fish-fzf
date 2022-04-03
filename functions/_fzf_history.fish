function _fzf_history -d "Show command history"
    # history merge incorporates history changes from other fish sessions
    builtin history merge

    set result (
        builtin history --null |
        fzf --read0 \
            --tiebreak=index \
            --query=(commandline) |
        string collect
    )

    if test $status -eq 0
        set command_selected (string split --max 1 " │ " $result)[2]
        commandline --replace -- $command_selected
    end

    commandline --function repaint
end
