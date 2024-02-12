@echo off

REM vscodeフォルダ内のdataフォルダ以外を削除
for /D %%I in ("%~dp0vscode\*") do (
    if not "%%~nxI"=="data" (
        rmdir /s /q "%%I"
    )
)

REM vscodeフォルダ内のファイルを削除
for %%F in ("%~dp0vscode\*") do (
    del "%%F"
)

REM ダウンロード先のファイルパス
set "downloadPath=%~dp0vscode.zip"

curl.exe -L "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -o "%downloadPath%"

REM VSCodeZipフォルダからvscode-zipを解凍
"E:\7-ZipPortable\App\7-Zip64\7z.exe" x "%downloadPath%" -o"%~dp0vscode"

REM ファイルを削除
del "%downloadPath%"

echo VSCodeを更新しました。