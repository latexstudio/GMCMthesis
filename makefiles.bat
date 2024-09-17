@rem ------------------------------------------------
@rem            LaTeX Automated Compiler
@rem ------------------------------------------------
@echo off
@rem ------------------------------------------------
@rem ->> Set tex compiler
@rem ------------------------------------------------
set CompileName="xelatex"
@rem ------------------------------------------------
@rem ------------------------------------------------
@rem ->> Get source filename
@rem ------------------------------------------------
for %%F in (*.tex) do (
set FileName=%%~nF
)
@rem ------------------------------------------------
@rem ->> Set environmental variables
@rem ------------------------------------------------
set TEXINPUTS=.//;%TEXINPUTS%
set BIBINPUTS=.//;%BIBINPUTS%
set BSTINPUTS=.//;%BSTINPUTS%
@rem ------------------------------------------------
@rem ->> Build textual content
@rem ------------------------------------------------
%CompileName% %FileName%
@rem ------------------------------------------------
@rem ->> Build references and links
@rem ------------------------------------------------
bibtex %FileName%
%CompileName% %FileName%
%CompileName% %FileName%
@rem ------------------------------------------------
@rem ->> Delete temporary file
@rem ------------------------------------------------
del /q *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.synctex(busy)
del /q *.nav *.snm *.vrb *.fls *.xdv *.fdb_latexmk
@rem ------------------------------------------------
@rem ->> View compiled file
@rem ------------------------------------------------
echo ------------------------------------------------
echo %CompileName% %FileName%.tex finished...
echo ------------------------------------------------

