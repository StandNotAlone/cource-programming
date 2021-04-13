#!/bin/bash

cd docs/PTA题解;

for f in PTA*.md;
	do pandoc "$f" -o "${f%.md}.pdf" --pdf-engine=xelatex.exe -V documentclass=ctexart --listings --template=../../default.latex --lua-filter=../../promote-headers.lua;
done