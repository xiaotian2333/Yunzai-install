:: 小天开发
@echo off
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
:: 新建文件夹
md "%~dp0\%name%"
xcopy "%~dp0\%zai-name%" "%~dp0\%name%\%zai-name%\"  /q /e /r /S /Y

:: 特殊处理部分
:: 云崽特殊处理
if "%zai-type%"=="1" (
    mklink /H "%~dp0\%name%\%zai-name%\package.json" "%~dp0\Yunzai-Bot-res\package.json"
    md "%~dp0\%name%\%zai-name%\resources
    mklink /d "%~dp0\%name%\%zai-name%\resources\font" "%~dp0\Yunzai-Bot-res\resources\font"
)
:: 喵崽特殊处理
if "%zai-type%"=="2" (
    mklink /H "%~dp0\%name%\%zai-name%\package.json" "%~dp0\Miao-Yunzai-res\package.json"
    mklink /H "%~dp0\%name%\%zai-name%\.eslintrc.cjs" "%~dp0\Miao-Yunzai-res\.eslintrc.cjs"
    mklink /H "%~dp0\%name%\%zai-name%\.npmrc" "%~dp0\Miao-Yunzai-res\.npmrc"
    mklink /H "%~dp0\%name%\%zai-name%\.puppeteerrc.cjs" "%~dp0\Miao-Yunzai-res\.puppeteerrc.cjs"
    mklink /H "%~dp0\%name%\%zai-name%\pnpm-workspace.yaml" "%~dp0\Miao-Yunzai-res\pnpm-workspace.yaml"
)

:: 通用处理部分
:: 基础文件夹
mklink /d "%~dp0\%name%\%zai-name%\config\default_config" "%~dp0\Yunzai-Bot-res\config\default_config"
mklink /H "%~dp0\%name%\%zai-name%\云崽管理器.bat" "%~dp0\Yunzai-Bot-res\云崽管理器.bat"
mklink /d "%~dp0\%name%\%zai-name%\plugins\genshin\resources" "%~dp0\Yunzai-Bot-res\plugins\genshin\resources" 

:: 新建缓存文件夹
md "%~dp0\%name%\%zai-name%\data"
:: 角色攻略缓存
mklink /d "%~dp0\%name%\%zai-name%\data\strategy" "%~dp0\Yunzai-Bot-res\data\strategy"
:: 角色攻略缓存
mklink /d "%~dp0\%name%\%zai-name%\data\material_other" "%~dp0\Yunzai-Bot-res\data\material_other"
:: 资源地图缓存
mklink /d "%~dp0\%name%\%zai-name%\data\map" "%~dp0\Yunzai-Bot-res\data\map"
:: material_友人A
mklink /d "%~dp0\%name%\%zai-name%\data\material_友人A" "%~dp0\Yunzai-Bot-res\data\material_友人A"

:: 数据互通处理
:: 还没写呢

:: 开装喵喵插件
cd %name%\%zai-name%
git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/

:: 开装依赖
pnpm i

cd ../..

echo =====安装完毕=====
echo 用户文件夹："%~dp0\%name%"
echo 云崽类型：%zai-name%
echo =================

cmd