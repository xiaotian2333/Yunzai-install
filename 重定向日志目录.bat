:: С�쿪��
@echo off
set tmp-path="A:"
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

:: ɾ�����е���־�ļ���
del /f /q "%~dp0\%name%\%zai-name%\logs"
:: �ڴ������½���Ӧ�ļ���
md "%tmp-path%\%name%"
:: ��־�ض����ڴ���
mklink /d "%~dp0\%name%\%zai-name%\logs" "%tmp-path%\%name%"

pause