@echo off
chcp 65001 > nul
cd /d "%~dp0"

echo ============================================
echo  CowAgent - Roleplay 启动脚本
echo ============================================

:: 加载 .env 文件中的环境变量
if exist ".env" (
    echo [INFO] 加载 .env 环境变量...
    for /f "usebackq delims=" %%i in (".env") do (
        for /f "tokens=1,* delims==" %%a in ("%%i") do (
            if not "%%a"=="" if not "%%a:~0,1"=="#" (
                set "%%a=%%b"
            )
        )
    )
) else (
    echo [WARN] 未找到 .env 文件，使用 config.json 中的配置
)

:: 如果设置了 MODEL 环境变量，覆盖 config.json
if not "%MODEL%"=="" (
    echo [INFO] 使用模型: %MODEL%
)

echo [INFO] 启动 CowAgent...
python app.py

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 启动失败，错误码: %ERRORLEVEL%
    pause
)
