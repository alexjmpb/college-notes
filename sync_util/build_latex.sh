#!/bin/bash
export FILE_PATH=$1
export FILE_DIRNAME=$2
cd $FILE_DIRNAME
latexmk -pdf -outdir="$FILE_DIRNAME/build/" $FILE_PATH
pdflatex -file-line-error --output-directory="$FILE_DIRNAME/build/" $FILE_PATH
