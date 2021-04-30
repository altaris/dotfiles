function fish_prompt --description 'Write out the prompt'

#   set -l last_status $status

    echo -n '┌─['

    # User
    set_color --bold yellow
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color --bold red
    echo -n (cat /etc/hostname)
    set_color normal

    echo -n ']──['

    # PWD
    set_color --bold blue
    echo -n (prompt_pwd)
    set_color normal

    echo -n '] '

    echo

#   if not test $last_status -eq 0
#       set_color $fish_color_error
#   end

    echo -n '└──╼ '
    set_color normal
end
