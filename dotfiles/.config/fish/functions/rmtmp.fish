function rmtmp

    # tex
    find . -name "*.aux"            -type f -exec rm -v '{}' \;
    find . -name "*.aux"            -type f -exec rm -v '{}' \;
    find . -name "*.bbl"            -type f -exec rm -v '{}' \;
    find . -name "*.blg"            -type f -exec rm -v '{}' \;
    find . -name "*.idx"            -type f -exec rm -v '{}' \;
    find . -name "*.ilg"            -type f -exec rm -v '{}' \;
    find . -name "*.ind"            -type f -exec rm -v '{}' \;
    find . -name "*.log"            -type f -exec rm -v '{}' \;
    find . -name "*.out"            -type f -exec rm -v '{}' \;
    find . -name "*.synctex.gz"     -type f -exec rm -v '{}' \;
    find . -name "*.toc"            -type f -exec rm -v '{}' \;
    find . -name "_minted*"         -type d -exec rm -rv '{}' \;
    find . -name "*.fdb_latexmk"    -type d -exec rm -rv '{}' \;
    find . -name "*.fls"            -type d -exec rm -rv '{}' \;

    # gluplot
    find . -name "*.*.gnuplot"      -type f -exec rm -v '{}' \;
    find . -name "*.*.table"        -type f -exec rm -v '{}' \;

    # compilers
    find . -name "*.class"          -type f -exec rm -v '{}' \;
    find . -name "*.java~"          -type f -exec rm -v '{}' \;
    find . -name "*.o"              -type f -exec rm -v '{}' \;

    # mac
    find . -name "*.DS_Store"       -type f -exec rm -v '{}' \;
    find . -name "._*"              -type f -exec rm -v '{}' \;
    find . -name ".Trashes"         -type f -exec rm -v '{}' \;
    find . -name ".Spotlight-V100"  -type f -exec rm -v '{}' \;

end