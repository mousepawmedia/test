:: Inner make.bat (MousePaw Media Build System)
:: Version: 3.3.0

@echo off
setlocal

:: CHANGE: Project name
set NAME=Sandbox (Tester)

:: CHANGE: Set to 'lib' or 'bin'
set BUILD_DIR=bin

:: Includes inner make.bat logic. (Change if necessary to point to inner.bat)
call build_system\inner.bat
endlocal
