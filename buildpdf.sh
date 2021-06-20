#!/bin/bash

cd docs/PTA题解;

for f in PTA*.md; do
	if [ "$f" == "*.md" ] ; then
		echo "null";
		break
	fi
	echo "pandoc $f -> ${f%.md}.pdf";
	pandoc "$f" -o "${f%.md}.pdf" --pdf-engine=xelatex -V documentclass=ctexart --listings --template=../../default.latex --lua-filter=../../promote-headers.lua;
done
