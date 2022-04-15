function _fzf_path
    set fd_command fd \
        --color=never \
        --strip-cwd-prefix
    set fzf_command fzf \
        --height 40% \
        --reverse \
        --color=16

    set result ($fd_command | $fzf_command)

    if test -n "$result"
      if test -d "$result"
        set result $result/
      end

      commandline -i -- $result
    end

    commandline -f repaint
end
