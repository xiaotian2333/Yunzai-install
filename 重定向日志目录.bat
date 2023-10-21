:: 小天开发
@echo off
set tmp-path="A:"
set name="新建文件夹"
set /p name=请输入用户文件夹名:
:: 云崽类型
:: 1:Yunzai-Bot 2:Miao-Yunzai
:: 默认使用喵崽
set zai-type="2"
echo ===请选择云崽类型===
echo (1) Yunzai-Bot (2) Miao-Yunzai
echo =====请输入选择=====
set /p zai-type=等待输入:

:: 处理云崽类型
if "%zai-type%"=="1" (
    set zai-name="Yunzai-Bot"
)

if "%zai-type%"=="2" (
    set zai-name="Miao-Yunzai"
)

:: 删除已有的日志文件夹
del /f /q "%~dp0\%name%\%zai-name%\logs"
:: 内存盘中新建对应文件夹
md "%tmp-path%\%name%"
:: 日志重定向到内存盘
mklink /d "%~dp0\%name%\%zai-name%\logs" "%tmp-path%\%name%"

pause