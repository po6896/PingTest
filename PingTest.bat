@echo off
setlocal

REM Pingを送信するIPアドレス
set "targetIP=www.google.com"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=www.yahoo.co.jp"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=192.168.1.1"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=0.0.0.0"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM 何かメッセージを表示
REM echo キーを押してください.

REM ユーザーがキーを押すのを待機
pause

endlocal
