@echo off
setlocal
REM 疎通チェックバッチファイル
REM 対象 DB WEB Engine x 2 のIP

REM 管理者として実行されているかチェック
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo このスクリプトを実行するには管理者権限が必要です。
    pause
    exit
)

REM ここからバッチファイルの処理を記述
REM echo このバッチファイルは管理者として実行されています。

REM Pingを送信するIPアドレス
set "targetIP=127.0.0.1"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。DBサーバー アドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。サーバー IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=8.8.8.8"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。WebAPサーバー IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。WebAPサーバー IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=1.1.1.1"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。Engineサーバー#1 IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。Engineサーバー#1 IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM Pingを送信するIPアドレス
set "targetIP=1.0.0.1"

REM Pingを送信し、応答があるか確認
ping -n 1 %targetIP% > nul

REM 変数xの値に応じてメッセージを表示
if %errorlevel%==0 (
    echo 応答がありました。Engineサーバー#2 IPアドレス %targetIP% はオンラインです.
) else (
    echo 応答がありませんでした。Engineサーバー#2 IPアドレス %targetIP% はオフラインか応答が遅い可能性があります.
)

REM 何かメッセージを表示
REM echo キーを押してください.

REM ユーザーがキーを押すのを待機
pause

endlocal
