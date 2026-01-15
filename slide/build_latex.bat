@echo off
REM Chuyen den thu muc chua script nay
cd /d "%~dp0"

echo ==========================================
echo       BAT DAU BIEN DICH SLIDE LATEX
echo ==========================================

REM Kiem tra xem pdflatex co ton tai khong
where pdflatex >nul 2>nul
if %errorlevel% neq 0 (
    echo [LOI] Khong tim thay lenh 'pdflatex'.
    echo Vui long cai dat MiKTeX hoac TeX Live va them vao PATH.
    pause
    exit /b
)

echo.
echo [1/2] Chay pdflatex lan 1...
pdflatex -interaction=nonstopmode main.tex

echo.
echo [2/2] Chay pdflatex lan 2 (cap nhat muc luc/tham chieu)...
pdflatex -interaction=nonstopmode main.tex

echo.
echo ==========================================
echo             HOAN TAT
echo ==========================================
echo.

if exist main.pdf (
    echo File PDF da duoc tao tai: %~dp0main.pdf
) else (
    echo [LOI] Co loi xay ra, khong tao duoc file PDF.
)

pause
