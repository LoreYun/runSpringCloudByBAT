@echo off
if "%~1"=="" (
 set /p file=Please drag you jar file to this window. ：
) else (
 set file=%~1
)

if not defined file (
goto notFindFile
)
if not exist %file% (
goto notFindFile
)

set /p port=Please enter the specify port for "server.port". Keep it empty to use default port in Jar config file.：
goto setTitle

::java -jar %file% --config.ip=localhost --eureka.ip=localhost --server.port=9180
:notFindFile
echo File not found
goto end

:setTitle
if not defined port (
title %file%
) else (
title %file%,port:%port%
)
goto runServer

:runServer
if not defined port (
java -jar %file% --config.ip=localhost --eureka.ip=localhost
) else (
java -jar %file% --config.ip=localhost --eureka.ip=localhost --server.port=%port%
)
:end
pause
