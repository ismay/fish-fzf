function _fzf_f
    set f_command f -l
    set awk_command awk -F ' ' '{print $2}'
    set fzf_command fzf \
        --tiebreak index \
        --height 40% \
        --reverse \
        --color=16

    set result ($f_command  | $awk_command | $fzf_command)

    if test -n "$result"
        commandline -i $result
    end

    commandline -f repaint
end
