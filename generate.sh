if [ $(which inkscape|wc -l) -gt 0 ]; then
    EXE=$(echo inkscape)
else
    EXE=$(echo flatpak run org.inkscape.Inkscape)
fi

for i in *.svg; do
    OUT=$(basename $i svg)pdf
    if [ $i -nt $OUT ]; then
    	$EXE $i -TCo $OUT
    fi
done
