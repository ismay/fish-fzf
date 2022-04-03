function _fzf_cd -d "Change directory"
    set fd_command fd \
        --type d \
        --color=never \
        .

    set fzf_command fzf \
        --height 40% \
        --reverse \
        $FZF_DEFAULT_OPTS

    set result ($fd_command | $fzf_command)

    if [ -n "$result" ]
        cd -- $result
    end

    commandline -f repaint
end
