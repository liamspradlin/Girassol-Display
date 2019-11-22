TTFDIR="./fonts"
rm -r $TTFDIR/*.ttf

fontmake -u ./sources/Girassol-Regular.ufo -o ttf --output-dir ./fonts/ -a

for f in $TTFDIR/*.ttf
do
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo