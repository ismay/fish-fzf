function _fzf_git_branch
    set is_inside_work_tree (git rev-parse --is-inside-work-tree 2>/dev/null)
    if test -z $is_inside_work_tree; or test $is_inside_work_tree = false
        commandline -f repaint
        return
    end

    set git_branches (git for-each-ref refs/heads --format='%(refname:lstrip=2)' --sort='-committerdate')

    set fzf_command fzf \
        --multi \
        --height 40% \
        --reverse \
        --color=16

    set result (printf '%s\n' $git_branches | $fzf_command)

    if test -n "$result"
        commandline -i -- (string join ' ' $result)
    end

    commandline -f repaint
end
