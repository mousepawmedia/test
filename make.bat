:: Outer make.bat (MousePaw Media Build System)
:: Version: 3.3.0

@echo off
setlocal

:: CHANGE: Library name
set LIB_PROJECT=Sandbox

:: CHANGE: Executable name
set EXE_PROJECT=Sandbox Tester

:: CHANGE: Project base filenames
set LIB_NAME=sandbox
set EXE_NAME=%LIB_NAME%-tester

:: CHANGE: Target/alias name for executable (optional)
set EXE_NICKNAME=tester

:: CHANGE: Uncomment for header-only libraries.
set /A HEADER_ONLY=1

:: CHANGE: Library source directory
set LIB_SRC=%LIB_NAME%-source
:: CHANGE: Executable source directory
set EXE_SRC=%EXE_NAME%

:: CHANGE: Ready directory name
set READY_DIR=%LIB_NAME%

:: Includes inner make.bat logic. (Change if necessary to point to outer.bat)
call build_system\outer.bat %*
endlocal
