::小天开发
@echo off
set name="新建文件夹"
set /p name=请输入用户文件夹名:

:: 新建文件夹
md "C:\BOT\%name%"
xcopy "C:\BOT\Yunzai-Bot" "C:\BOT\%name%\Yunzai-Bot\"  /q /e /r /S /Y

::基础文件夹
mklink /d "C:\BOT\%name%\Yunzai-Bot\config\default_config" "C:\BOT\Yunzai-Bot-res\config\default_config"
mklink /d "C:\BOT\%name%\Yunzai-Bot\resources" "C:\BOT\Yunzai-Bot-res\resources"
mklink /H "C:\BOT\%name%\Yunzai-Bot\package.json" "C:\BOT\Yunzai-Bot-res\package.json"
mklink /H "C:\BOT\%name%\Yunzai-Bot\云崽管理器.bat" "C:\BOT\Yunzai-Bot-res\云崽管理器.bat"

::缓存文件夹
md "C:\BOT\%name%\Yunzai-Bot\data"
:: 角色攻略缓存
mklink /d "C:\BOT\%name%\Yunzai-Bot\data\strategy" "C:\BOT\Yunzai-Bot-res\data\strategy"
::角色攻略缓存
mklink /d "C:\BOT\%name%\Yunzai-Bot\data\material_other" "C:\BOT\Yunzai-Bot-res\data\material_other"
::资源地图缓存
mklink /d "C:\BOT\%name%\Yunzai-Bot\data\map" "C:\BOT\Yunzai-Bot-res\data\map"
::material_友人A
mklink /d "C:\BOT\%name%\Yunzai-Bot\data\material_友人A" "C:\BOT\Yunzai-Bot-res\data\material_友人A"
