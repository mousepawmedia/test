:: Inner make.bat (MousePaw Media Build System)
:: Version: 3.3.0

:: LICENSE (BSD-3-Clause)
:: Copyright (c) 2018 MousePaw Media.
:: All rights reserved.
::
:: Redistribution and use in source and binary forms, with or without
:: modification, are permitted provided that the following conditions are met:
::
:: 1. Redistributions of source code must retain the above copyright notice,
:: this list of conditions and the following disclaimer.
::
:: 2. Redistributions in binary form must reproduce the above copyright notice,
:: this list of conditions and the following disclaimer in the documentation
:: and/or other materials provided with the distribution.
::
:: 3. Neither the name of the copyright holder nor the names of its contributors
:: may be used to endorse or promote products derived from this software without
:: specific prior written permission.
::
:: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
:: AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
:: IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
:: ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
:: LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
:: CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
:: SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
:: INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
:: CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
:: ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
:: THE POSSIBILITY OF SUCH DAMAGE.
::
:: CONTRIBUTING
:: See https://www.mousepawmedia.com/developers for information
:: on how to contribute to our projects.

set CMAKE=cmake ..\.. -G"Ninja"
set T_DEBUG=-DCMAKE_BUILD_TYPE=Debug
set T_RELEASE=-DCMAKE_BUILD_TYPE=Release

set MK_DIR=cmake -E make_directory
set CH_DIR=cmake -E chdir
set RM_DIR=cmake -E remove_directory
set ECHO=cmake -E echo
set NINJA=ninja

set TEMP_DIR=build_temp

set EXEC_BUILD=%CH_DIR% %TEMP_DIR%

if [%1]==[] goto help
set target=%1
shift
set MORE_ARGS=%1 %2 %3 %4 %5 %6 %7 %8 %9
:: Because variables cannot be used in labels, we have to check those manually.
if %target%==%LIB_NAME% (
    call :lib
    goto exit
)
if %target%==%LIB_NAME%_debug (
    call :lib_debug
    goto exit
)
if %target%==%EXE_NICKNAME% (
    call :exe
    goto exit
)
if %target%==%EXE_NICKNAME%_debug (
    call :exe_debug
    goto exit
) else (
    call :%target%
    goto exit
)
goto exit

:help
%ECHO% "=== %LIB_PROJECT% ==="
exit /B 0

:clean
%RM_DIR% %BUILD_DIR%
%RM_DIR% %TEMP_DIR%

:cleandebug
%RM_DIR% %BUILD_DIR%\Debug
%RM_DIR% %TEMP_DIR%\Debug

:cleanrelease
%RM_DIR% %BUILD_DIR%\Release
%RM_DIR% %TEMP_DIR%\Release

:debug
%MK_DIR% %TEMP_DIR%\Debug
%CH_DIR% %TEMP_DIR%\Debug %CMAKE% %T_DEBUG% %MORE_ARGS%
%EXEC_BUILD%\Debug %NINJA%

:release
%MK_DIR% %TEMP_DIR%\Release
%CH_DIR% %TEMP_DIR%\Release %CMAKE% %T_RELEASE% %MORE_ARGS%
%EXEC_BUILD%\Debug %NINJA%

:exit
exit /B 0
