#!/bin/bash

rm *log *lot *lof *out *toc *aux
rm Chapters/*aux


pdflatex memoria.tex
bibtex memoria
pdflatex memoria.tex
pdflatex memoria.tex



