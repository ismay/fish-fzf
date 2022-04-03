function _fzf_file -d "List files and folders"
    set fd_command fd \
        --color=never \
        --strip-cwd-prefix

    set fzf_command fzf \
        --height 40% \
        --reverse \
        --color=16

    set result ($fd_command | $fzf_command)

    if [ -n "$result" ]
        commandline -i (string escape $result)
        commandline -i ' '
    end

    commandline -f repaint
end
