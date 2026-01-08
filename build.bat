@echo off
echo =================================
echo LaTeX Compilation Script
echo =================================

REM Create build directory if it doesn't exist
if not exist build (
    mkdir build
    echo Created build folder
)

echo.
echo Step 1: First LaTeX compilation...
pdflatex -output-directory=build -interaction=nonstopmode main.tex

echo.
echo Step 2: Running BibTeX...
cd build
bibtex main
cd ..

echo.
echo Step 3: Second LaTeX compilation...
pdflatex -output-directory=build -interaction=nonstopmode main.tex

echo.
echo Step 4: Final LaTeX compilation...
pdflatex -output-directory=build -interaction=nonstopmode main.tex



echo.
echo =================================
echo Compilation completed!
echo =================================


if exist main.pdf (
    del main.pdf
)

if exist build\main.pdf (
    echo SUCCESS: build\main.pdf has been generated!
    echo Opening PDF...
    start build\main.pdf
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