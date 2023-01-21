@echo off
echo Running tests for %~dp0
lua .\src\tests\run_tests.lua
