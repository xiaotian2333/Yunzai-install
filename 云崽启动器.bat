@echo off
:: ��־�ض��򣬿���Ϊ "1"  ������Ϊ "0"
set log-redirect="1"
:: �ڴ���Ŀ¼���粻ʹ����־�ض���ɲ�������
set tmp-path="A:"
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
        :: ȡ��ǰ�û���
        for %%i in (..) do set name=%%~nxi
        :: �ж��Ƿ��Ѵ���������
        for /f %%i in ('dir /al/b "logs" 2^>nul') do set is_link=%%i
            if defined is_link (
                :: �Ѵ��ڣ��ж��ڴ������Ƿ���ڶ�ӦĿ¼
                if not exist "%tmp-path%\%name%" (
                    md "%tmp-path%\%name%"
                )
            ) else (
                :: ���������ӣ�ɾ��������������
                rd /s /q ".\logs"
                md "%tmp-path%\%name%"
                mklink /d ".\logs" "%tmp-path%\%name%"
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
    echo =============�ű���Ϣ================
    echo ���ű�Ϊ����xiaotian��ҳ�����̿�����
    echo �汾1.2
    echo �����ˤμң�628306033
    echo Copyright 2023 xiaotian
    echo ====================================
    goto start
)

:: ���н���
echo �ű��˳�
exit