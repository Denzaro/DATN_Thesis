@echo off
echo =================================
echo LaTeX Compilation Script
echo =================================

echo Step 1: First LaTeX compilation...
pdflatex -interaction=nonstopmode main.tex

echo.
echo Step 2: Running BibTeX...
bibtex main

echo.
echo Step 3: Second LaTeX compilation...
pdflatex -interaction=nonstopmode main.tex

echo.
echo Step 4: Final LaTeX compilation...
pdflatex -interaction=nonstopmode main.tex

echo.
echo =================================
echo Compilation completed!
echo =================================

if exist main.pdf (
    echo SUCCESS: main.pdf has been generated!
    echo Opening PDF...
    start main.pdf
) else (
    echo ERROR: PDF was not generated. Check the logs above.
    echo Checking for common issues:
    if not exist references.bib (
        echo - Missing references.bib file
    )
    if not exist chapters\chapter1.tex (
        echo - Missing chapters\chapter1.tex file
    )
)

pause