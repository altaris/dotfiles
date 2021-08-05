function aptr -d 'Removes a package' -a PACKAGE
    if test -z "$PACKAGE"
        set PACKAGE (apt list --installed 2> /dev/null | sed -n 's?/.*??p' | fzf)
    end
    if test -n "$PACKAGE"
        sudo apt-get purge "$PACKAGE"
    end
end
