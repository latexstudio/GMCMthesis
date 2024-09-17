#!/bin/bash

#-> Get source filename
find . -name "*.tex"|while read FileName;
do 
#--- Process FileName.tex ---
echo "$FileName"
echo "${FileName%.tex}"
#-> Compile the main file
xelatex --synctex=-1 "$FileName"
bibtex "${FileName%.tex}"
xelatex --synctex=-1 "$FileName"
xelatex --synctex=-1 "$FileName"
#clear aux files
rm -r *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb 
done

