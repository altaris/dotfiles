function apti -d 'Installs a package' -a PACKAGE
    if test -z "$PACKAGE"
        set PACKAGE (apt list 2> /dev/null | sed -n 's?/.*??p' | fzf)
    end
    if test -n "$PACKAGE"
        sudo apt-get install "$PACKAGE"
    end
end
