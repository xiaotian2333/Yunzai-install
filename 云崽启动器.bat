@echo off
::chcp 65001
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
    echo �汾1.1
    echo �����ˤμң�628306033
    echo Copyright ? 2023 xiaotian
    echo ====================================
    goto start
)

:: ���н���
echo �ű��˳�
exit