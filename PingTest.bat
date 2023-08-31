@echo off
setlocal enabledelayedexpansion

REM ----------------------------------------------------
REM このバッチファイルは、指定されたIPアドレスにpingを送信し、
REM サーバーの疎通状態を確認するものです。
REM ----------------------------------------------------

echo +-------------------------------------------+---------------------------+
echo ^|               サーバー名                  ^|          ステータス       ^|
echo +-------------------------------------------+---------------------------+

REM Pingを送信するIPアドレスとサーバー名をセット
set target[0]=127.127.127.127,DBサーバー
set target[1]=8.8.8.8,WebAPサーバー
set target[2]=1.1.1.1,Engineサーバー#1
set target[3]=1.0.0.1,Engineサーバー#2

REM 各ターゲットに対してpingを実行
REM for /L(数値の範囲を指定してループ) %%変数 in (start,step,end)
REM /f ファイル・文字列を解析し、それに基づいて繰り返し処理
REM tokens 区切り文字で分割された文字列の各部分 delims 区切り文字
for /L %%i in (0,1,3) do (
    for /f "tokens=1,2 delims=," %%a in ("!target[%%i]!") do (
        set "targetIP=%%a"
        set "serverName=%%b"
        
        REM ターゲットIPへのPing送信
        ping -n 1 !targetIP! > nul
        REM Pingの応答結果に応じてステータスを設定
        if not errorlevel 1 (
            set "status=オンライン"
        ) else (
            set "status=オフライン"
        )
        
        REM 表示する文字列の長さを調整
        call :padString "!serverName! IPアドレス !targetIP!" 33 serverOutput
        call :padString "!status!" 20 statusOutput

        REM 調整後の文字列を出力
        echo ^| !serverOutput! ^| !statusOutput! ^|
        echo +-------------------------------------------+---------------------------+
    )
)

pause
endlocal
goto :eof

REM ----------------------------------------------------
REM padString関数: 文字列を指定の長さになるように空白で埋める
REM 引数:
REM   %1: 入力文字列
REM   %2: 目的の文字列長
REM   %3: 結果を保存する変数の名前
REM ----------------------------------------------------
:padString <inputString> <targetLength> <outputVariable>
setlocal
set "str=%~1"
set "len=%~2"
set "pad="
REM 空白で埋めるための文字列を作成
for /l %%A in (1,1,%len%) do set "pad=!pad! "
set "result=%str%!pad!"
set "result=!result:~0,%len%!"
endlocal & set "%~3=%result%"
goto :eof
