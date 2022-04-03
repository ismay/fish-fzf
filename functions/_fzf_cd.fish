function _fzf_cd -d "Change directory"
    set fd_command fd \
        --type d \
        --color=never \
        --strip-cwd-prefix \
        .

    set fzf_command fzf \
        --height 40% \
        --reverse \
        --color=16

    set result ($fd_command | $fzf_command)

    if [ -n "$result" ]
        cd -- $result
    end

    commandline -f repaint
end
