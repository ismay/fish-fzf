function _fzf_z
    set z_command zoxide query --list
    set fzf_command fzf \
        --tiebreak index \
        --height 40% \
        --reverse \
        --color=16

    set result ($z_command | $fzf_command)

    if test -n "$result"
        set result $result/
        commandline -i $result
    end

    commandline -f repaint
end
