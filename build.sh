TTFDIR="./fonts"
rm -r $TTFDIR/*.ttf

fontmake -u ./sources/Girassol-Regular.ufo -o ttf --output-dir ./fonts/

for f in $TTFDIR/*.ttf
do
	gftools fix-dsig --autofix $f
	gftools fix-nonhinting $f $f.fix
	mv $f.fix $f
	rm ${f//.ttf/-backup-fonttools-prep-gasp.ttf}
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo