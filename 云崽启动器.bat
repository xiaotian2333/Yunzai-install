@echo off
::chcp 65001
:start

:: 输出提示
echo =============咸鱼xiaotian控制端================
echo (1)  启动云崽                 (2)  更换账号
echo (3)  脚本信息                 (4)  退出脚本
echo ==============================================
echo 请在10秒内输入，否则自动运行云崽

choice /c:1234 /M 输入选择 /t 10 /d 1

IF ERRORLEVEL 1 (
    set id=1
)
IF ERRORLEVEL 2 (
    set id=2
)
IF ERRORLEVEL 3 (
    set id=3
)
IF ERRORLEVEL 4 (
    set id=4
)
:: 启动云崽
if "%id%"=="1" (
    echo 正在启动云崽
    @node app
    exit
)
:: 换登录账号
if "%id%"=="2" (
    echo 更换登录账号，请使用安卓手机或安卓平板协议
    @node app login
    exit
)
:: 脚本信息
if "%id%"=="3" (
    echo =============脚本信息================
    echo 本脚本为咸鱼xiaotian网页端云崽控制器
    echo 版本1.1
    echo 机器人の家：628306033
    echo Copyright ? 2023 xiaotian
    echo ====================================
    goto start
)

:: 运行结束
echo 脚本退出
exit