@echo off
:: ��־�ض��򣬿���Ϊ "1"  ������Ϊ "0"
set log-redirect="1"
:: �ڴ���Ŀ¼���粻ʹ����־�ض���ɲ�������
set tmp-path="A:\Yunzai-log"
:start

:: �����ʾ
echo =============����xiaotian���ƶ�================
echo (1)  ��������                 (2)  �����˺�
echo (3)  �ű���Ϣ                 (4)  �˳��ű�
echo ==============================================
echo ����10�������룬�����Զ���������

choice /c:1234 /M ����ѡ�� /t 10 /d 1

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
:: ��������
if "%id%"=="1" (
    echo ������������
    :: ִ����־�ض����߼�
    if %log-redirect%=="1" (
        :: �ж��Ƿ��Ѵ���������
        for /f %%i in ('dir /al/b "logs" 2^>nul') do set is_link=%%i>nul
            if not defined is_link (
                :: ���������ӣ�ɾ��������������
                rd /s /q ".\logs">nul
                md "%tmp-path%\">nul 2>nul
                mklink /d ".\logs" "%tmp-path%\">nul
            )
    ) else (
        :: ��������������Ӿ�ɾ��������������
        for /f %%i in ('dir /al/b "logs" 2^>nul') do set is_link=%%i>nul
            if defined is_link (
                rmdir ".\logs">nul
            )
    )
    @node app
    exit
)
:: ����¼�˺�
if "%id%"=="2" (
    echo ������¼�˺ţ���ʹ�ð�׿�ֻ���׿ƽ��Э��
    @node app login
    exit
)
:: �ű���Ϣ
if "%id%"=="3" (
    echo ===================�ű���Ϣ======================
    echo ���ű�Ϊ ����xiaotian ��ҳ�����̿�����
    echo ���ű���Դ�� GitHub ��ӭ star
    echo https://github.com/xiaotian2333/yunzai-install
    echo �����ˤμң�628306033
    echo Copyright 2023 xiaotian
    echo =================================================
    goto start
)

:: ���н���
echo �ű��˳�
exit