#!/bin/bash

pdflatex memoria.tex
bibtex memoria.bcf
pdflatex memoria.tex
pdflatex memoria.tex

rm *log *lot *lof *out *toc


