function mkbooklet -a FILE X1 Y1 X2 Y2 D
    if test -z "$FILE"
        echo "Usage: $0 PDF_FILE [X1 [X2 [Y1 [Y2 [D]]]]]
X1 : X coordinate of the bottom left corner of the crop box (default 110)
Y1 : Y coordinate of the bottom left corner of the crop box (default 80)
X2 : X coordinate of the top right corner of the crop box (default 490)
Y2 : Y coordinate of the top right corner of the crop box (default 750)
D  : Cental spacing in the booklet (default 60)"
    else if test -f "$FILE"
        set TMPFILE (mktemp mkbooklet.tmp.XXXXXXXXXX.pdf)
        test -z "$X1"; and set X1 110
        test -z "$Y1"; and set Y1 80
        test -z "$X2"; and set X2 490
        test -z "$Y2"; and set Y2 750
        test -z "$D"; and set D 60
        gs -o "$TMPFILE" -sDEVICE=pdfwrite -c "[/CropBox [$X1 $Y1 $X2 $Y2]" \
            -c " /PAGES pdfmark" -f "$FILE"
        pdfjam --booklet "true" --landscape --suffix "book" \
            --delta $D"mm 0mm" -- "$TMPFILE" -
        rm "$TMPFILE"
    else
        echo "File \"$FILE\" doesn't exist or is not readable..."
    end
end
