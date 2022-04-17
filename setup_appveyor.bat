@echo off
set CurrentDir=%cd%
set ScriptDir=%~dp0
set EngineDir=%ScriptDir%\
set Args=%*

cd /d %EngineDir%
@echo on

cd %EngineDir%\

if not exist Vcpkg (
    mklink /D /J Vcpkg c:\tools\vcpkg
    pushd Vcpkg
    git pull -q
    popd
)

if not exist Vcpkg\vcpkg.exe (
    call Vcpkg\bootstrap-vcpkg.bat -disableMetrics
)

Vcpkg\vcpkg.exe install qt5-base

cd %CurrentDir%
