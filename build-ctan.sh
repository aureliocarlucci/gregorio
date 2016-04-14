#! /usr/bin/env bash

# Script to be executed by make ctan-dist

VERSION=`head -1 .gregorio-version`
FILEVERSION=`echo $VERSION | sed 's/\./_/g'`

rm -rf ctan
mkdir -p ctan/gregorio/
cp gregoriotex.tds.zip ctan/gregoriotex.tds.zip
cp gregorio-$VERSION.tar.bz2 ctan/gregorio/
cd ctan/gregorio
tar xf gregorio-$VERSION.tar.bz2
rm gregorio-$VERSION.tar.bz2
cp ../../*.md .
cd gregorio-$VERSION
mv doc/ ../
mv tex/ ../
mv fonts/ ../
mv examples/ ../doc/
rm -rf macosx debian
cd ..
rm doc/Makefile*
rm doc/examples/Makefile*
rm doc/examples/debugging.tex
rm tex/Makefile*
mkdir tex/lualatex
mkdir tex/luatex
mv tex/*.sty tex/lualatex
mv tex/*.* tex/luatex
rm fonts/Makefile*
mkdir fonts/sources/
mkdir fonts/truetype/
mv fonts/*.ttf fonts/truetype
mv fonts/*.* fonts/sources
cd gregorio-$VERSION
zip -r gregorio-$VERSION.zip * --exclude=*.DS_Store*
cd ..
rm -rf gregorio-$VERSION
cd ..
zip -r ../gregorio.zip gregorio
zip ../gregorio.zip gregoriotex.tds.zip
cd ..
