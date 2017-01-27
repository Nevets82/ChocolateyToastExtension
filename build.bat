@ECHO off
CD src
CHOCO pack
MOVE /Y *.nupkg ../packages/
CD ..