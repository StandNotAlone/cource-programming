#!/bin/bash

cd docs/PTA题解

for f in PTA*.md
	do pandoc "$f" -o "${f%.xls}.pdf" --pdf-engine=xelatex.exe -V documentclass="ctexart"
done