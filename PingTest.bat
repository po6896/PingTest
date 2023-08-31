@echo off
setlocal enabledelayedexpansion

echo --------------------------------------------------------------
echo IPアドレス        サーバー名              状態
echo --------------------------------------------------------------

for %%i in (
    "127.0.0.1" "DBサーバー" "8.8.8.8" "WebAPサーバー"
    "1.1.1.1" "Engineサーバー#1" "1.0.0.1" "Engineサーバー#2"
) do (
    set "targetIP=%%~i"
    ping -n 1 !targetIP! > nul

    if !errorlevel! equ 0 (
        set "status=オンライン"
    ) else (
        set "status=オフラインか応答遅延"
    )

    echo !targetIP!        %%~j  !status!
)

echo --------------------------------------------------------------
pause
endlocal
