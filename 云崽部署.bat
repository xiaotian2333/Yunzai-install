:: С�쿪��
@echo off
set name="�½��ļ���"
set /p name=�������û��ļ�����:
:: ��������
:: 1:Yunzai-Bot 2:Miao-Yunzai
:: Ĭ��ʹ������
set zai-type="2"
echo ===��ѡ����������===
echo (1) Yunzai-Bot (2) Miao-Yunzai
echo =====������ѡ��=====
set /p zai-type=�ȴ�����:

:: ������������
if "%zai-type%"=="1" (
    set zai-name="Yunzai-Bot"
)

if "%zai-type%"=="2" (
    set zai-name="Miao-Yunzai"
)
:: �½��ļ���
md "%~dp0\%name%"
xcopy "%~dp0\%zai-name%" "%~dp0\%name%\%zai-name%\"  /q /e /r /S /Y

:: ���⴦����
:: �������⴦��
if "%zai-type%"=="1" (
    mklink /H "%~dp0\%name%\%zai-name%\package.json" "%~dp0\Yunzai-Bot-res\package.json"
    md "%~dp0\%name%\%zai-name%\resources
    mklink /d "%~dp0\%name%\%zai-name%\resources\font" "%~dp0\Yunzai-Bot-res\resources\font"
)
:: �������⴦��
if "%zai-type%"=="2" (
    mklink /H "%~dp0\%name%\%zai-name%\package.json" "%~dp0\Miao-Yunzai-res\package.json"
    mklink /H "%~dp0\%name%\%zai-name%\.eslintrc.cjs" "%~dp0\Miao-Yunzai-res\.eslintrc.cjs"
    mklink /H "%~dp0\%name%\%zai-name%\.npmrc" "%~dp0\Miao-Yunzai-res\.npmrc"
    mklink /H "%~dp0\%name%\%zai-name%\.puppeteerrc.cjs" "%~dp0\Miao-Yunzai-res\.puppeteerrc.cjs"
    mklink /H "%~dp0\%name%\%zai-name%\pnpm-workspace.yaml" "%~dp0\Miao-Yunzai-res\pnpm-workspace.yaml"
)

:: ͨ�ô�����
:: �����ļ���
mklink /d "%~dp0\%name%\%zai-name%\config\default_config" "%~dp0\Yunzai-Bot-res\config\default_config"
mklink /H "%~dp0\%name%\%zai-name%\���̹�����.bat" "%~dp0\Yunzai-Bot-res\���̹�����.bat"
mklink /d "%~dp0\%name%\%zai-name%\plugins\genshin\resources" "%~dp0\Yunzai-Bot-res\plugins\genshin\resources" 

:: �½������ļ���
md "%~dp0\%name%\%zai-name%\data"
:: ��ɫ���Ի���
mklink /d "%~dp0\%name%\%zai-name%\data\strategy" "%~dp0\Yunzai-Bot-res\data\strategy"
:: ��ɫ���Ի���
mklink /d "%~dp0\%name%\%zai-name%\data\material_other" "%~dp0\Yunzai-Bot-res\data\material_other"
:: ��Դ��ͼ����
mklink /d "%~dp0\%name%\%zai-name%\data\map" "%~dp0\Yunzai-Bot-res\data\map"
:: material_����A
mklink /d "%~dp0\%name%\%zai-name%\data\material_����A" "%~dp0\Yunzai-Bot-res\data\material_����A"

:: ���ݻ�ͨ����
:: ��ûд��

:: ��װ�������
cd %name%\%zai-name%
git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/

:: ��װ����
pnpm i

cd ../..

echo =====��װ���=====
echo �û��ļ��У�"%~dp0\%name%"
echo �������ͣ�%zai-name%
echo =================

cmd