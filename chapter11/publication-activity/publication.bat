@echo off
setlocal
REM There is no need to call this if you set the MULE_HOME in your environment properties
REM but you must also define MULE_LIB for the example (see below)
REM or specify the config as a file: URI (see README.txt)
if "%MULE_HOME%" == "" SET MULE_HOME=%~dp0..\..
if "%MULE_BASE%" == "" SET MULE_BASE=%MULE_HOME%

REM This extends the classpath to include the configuration directory
REM Any changes to the files in .\conf will take precedence over those deployed to %MULE_HOME%\lib\user
SET MULE_LIB=.\conf;.\target\lib\activemq-core.jar;.\target\lib\activity-audit.jar;.\target\lib\html-dashboard.jar

# It is possible to name the particular instance of Mule that is started
# This is extremely useful when you have several instances running on the same server
SET MULE_APP="publication"

call "%MULE_BASE%\bin\mule.bat" -config publication-config.xml,server-stub-config.xml -M-Dmule.serverId=Publication

REM Send the test message with: wget --post-file='data/test.docbook' localhost:8080/publicationService
