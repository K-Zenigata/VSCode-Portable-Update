@echo off

REM vscode�t�H���_����data�t�H���_�ȊO���폜
for /D %%I in ("%~dp0vscode\*") do (
    if not "%%~nxI"=="data" (
        rmdir /s /q "%%I"
    )
)

REM vscode�t�H���_���̃t�@�C�����폜
for %%F in ("%~dp0vscode\*") do (
    del "%%F"
)

REM �_�E�����[�h��̃t�@�C���p�X
set "downloadPath=%~dp0vscode.zip"

curl.exe -L "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -o "%downloadPath%"

REM VSCodeZip�t�H���_����vscode-zip����
"E:\7-ZipPortable\App\7-Zip64\7z.exe" x "%downloadPath%" -o"%~dp0vscode"

REM �t�@�C�����폜
del "%downloadPath%"

echo VSCode���X�V���܂����B