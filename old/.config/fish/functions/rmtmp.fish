function rmtmp

    # tex
    find . -name "*.aux" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.aux" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.bbl" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.blg" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.idx" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.ilg" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.ind" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.log" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.out" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.synctex.gz" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.toc" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "_minted*" -type d -not -path "*/.git/*" -exec rm -rv '{}' \;
    find . -name "*.fdb_latexmk" -type d -not -path "*/.git/*" -exec rm -rv '{}' \;
    find . -name "*.fls" -type d -not -path "*/.git/*" -exec rm -rv '{}' \;

    # gluplot
    find . -name "*.*.gnuplot" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.*.table" -type f -not -path "*/.git/*" -exec rm -v '{}' \;

    # compilers
    find . -name "*.class" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.java~" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "*.o" -type f -not -path "*/.git/*" -exec rm -v '{}' \;

    # mac
    find . -name "*.DS_Store" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name "._*" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name ".Trashes" -type f -not -path "*/.git/*" -exec rm -v '{}' \;
    find . -name ".Spotlight-V100" -type f -not -path "*/.git/*" -exec rm -v '{}' \;

end