REM =========================================================================================
REM Ver 1.0 YYYY-MM-DD
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM The following command copies all folders, including empty folders, it recreates the security permissions, it EXCLUDES thumbs.db files
robocopy "\\Server\directory" "\\Server\directory" /MIR /SEC /S /E /XO /XF thumbs.db
echo.
echo    copied XXX folder
echo.
REM The next line pauses the execution so that the status (how many files were copied, how many were skipped, etc)
pause
