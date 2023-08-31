@echo off
setlocal enabledelayedexpansion

REM 疎通チェックバッチファイル
REM 対象: DB, WEB, Engine x 2 のIP

echo +-------------------------------------------+---------------------------+
echo ^|               サーバー名                  ^|          ステータス       ^|
echo +-------------------------------------------+---------------------------+

REM Pingを送信するIPアドレスとサーバー名
set target[0]=127.127.127.127,DBサーバー
set target[1]=8.8.8.8,WebAPサーバー
set target[2]=1.1.1.1,Engineサーバー#1
set target[3]=1.0.0.1,Engineサーバー#2

for /L %%i in (0,1,3) do (
    for /f "tokens=1,2 delims=," %%a in ("!target[%%i]!") do (
        set "targetIP=%%a"
        set "serverName=%%b"
        
        REM Pingを送信し、応答があるか確認
        ping -n 1 !targetIP! > nul
        if not errorlevel 1 (
            set "status=オンライン"
        ) else (
            set "status=オフライン"
        )
        
        REM サーバー名とステータスの文字列長を調整
        call :padString "!serverName! IPアドレス !targetIP!" 33 serverOutput
        call :padString "!status!" 20 statusOutput

        echo ^| !serverOutput! ^| !statusOutput! ^|
        echo +-------------------------------------------+---------------------------+
    )
)

pause
endlocal
goto :eof

:padString <inputString> <targetLength> <outputVariable>
setlocal
set "str=%~1"
set "len=%~2"
set "pad="
for /l %%A in (1,1,%len%) do set "pad=!pad! "
set "result=%str%!pad!"
set "result=!result:~0,%len%!"
endlocal & set "%~3=%result%"
goto :eof
