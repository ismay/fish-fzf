function _fzf_z
    set z_command z -l
    set awk_command awk -F ' ' '{print $2}'
    set fzf_command fzf \
        --tiebreak index \
        --height 40% \
        --reverse \
        --color=16

    set result ($z_command  | $awk_command | $fzf_command)

    if test -n "$result"
        set result $result/
        commandline -i $result
    end

    commandline -f repaint
end
