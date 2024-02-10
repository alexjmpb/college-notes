#!/bin/bash
export FILE_PATH=$1
export FILE_DIRNAME=$2
cd $FILE_DIRNAME
latexmk -pdf -outdir="$FILE_DIRNAME/build/" $FILE_PATH -synctex=1 -interaction=nonstopmode -file-line-error
pdflatex -file-line-error -synctex=1 --output-directory="$FILE_DIRNAME/build/" $FILE_PATH -interaction=nonstopmode
