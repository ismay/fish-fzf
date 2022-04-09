function _fzf_git_status
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo 'Not in a git repository.'
        commandline -f repaint
        return
    end

    set git_command git -c color.status=always status --short
    set fzf_command fzf \
        --multi \
        --ansi \
        --height 40% \
        --reverse \
        --color=16

    set result ($git_command | $fzf_command)

    if test -n "$result"
        set cleaned_result

        for path in $result
            if test (string sub --length 1 $path) = R
                set --append cleaned_result (string split -- "-> " $path)[-1]
            else
                set --append cleaned_result (string sub --start=4 $path)
            end
        end

        commandline -i -- (string join ' ' $cleaned_result)
    end

    commandline -f repaint
end
