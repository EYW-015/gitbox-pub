@echo off
:mainmenu
cls
echo.   ��ӭʹ��EVEС���߼�
echo.   �����߼����ߣ�EYW
echo.
echo.**********�˵�**********
echo.   1-EVE���ñ��ݻָ�
echo.   2-�޸�EVE����Ŀ¼
echo.   3-������������г
echo.************************
echo.
echo.����ѡ�����:  (0�˳�)
set /p idm=
if "%idm%"=="0" goto exit
if "%idm%"=="1" goto cfgman
if "%idm%"=="2" goto cacheman
if "%idm%"=="3" (
	goto zhpatchman
) else (
	goto exit
)

rem �����ļ�����##########################################################
:cfgman
cls
echo.     EVE�����ļ�����
echo.**********˵��**********
echo.EVE�����ļ���������
echo.��ʾ���ã������������趨
echo.��Ϸ�ڴ��ڴ�С��λ��
echo.�������ȵ�һϵ����������
echo.************************
pause
cls
echo.     EVE�����ļ�����
echo.******�����ļ�����******
echo.    1-���������ļ�
echo.    2-�ָ������ļ�
echo.    3-������Ŀ¼
echo.	(�ֶ��޸ļ�˵��)
echo.    4-�������˵�
echo.************************
echo.
echo.����ѡ�����:  (0�˳�)
set /p idc=
if "%idc%"=="0" goto exit
if "%idc%"=="1" goto backupcfg
if "%idc%"=="2" goto restorecfg
if "%idc%"=="3" goto opencfg
if "%idc%"=="4" (
	goto mainmenu
) else (
	goto exit
)

:backupcfg
cls
echo.**********˵��**********
echo.���豸�������ļ�
echo.�Ƚ����ļ��Ҹ��ط���
echo.�����ļ��ᱸ������ͬĿ¼��
echo.************************
pause
xcopy %LOCALAPPDATA%\CCP\EVE EVEcfg /s/i/q/y
pause
exit

:restorecfg
cls
echo.**********˵��**********
echo.����ָ����ݵ������ļ�
echo.�������ļ�������Ϊ"EVEcfg"
echo.�뱾�ļ�����һ��Ȼ�����м���
echo.************************
pause
xcopy EVEcfg %LOCALAPPDATA%\CCP\EVE /s/i/q/y
pause
exit

:opencfg
cls
echo.**********˵��**********
echo.�����ļ��洢�ļ�����������ļ���
echo.�����ļ������Ƹ�ʽΪ
echo.(����Ŀ¼)_serenity_serenity.evepc.163.com
echo.
echo.���绺��Ŀ¼��
echo.D:\Program Files\EVE\SharedCache
echo.��ô�����������ļ�����
echo.d_program_files_eve_shaedcache_serenity_serenity.evepc.163.com
echo.ȫСд��б�ܺͿո񻻳��»���
echo.************************
pause
start %LOCALAPPDATA%\CCP\EVE
pause
exit

rem �޸�EVE����Ŀ¼##########################################################
:cacheman
cls
echo.     EVE����Ŀ¼����
echo.**********˵��**********
echo.���������˻���Ŀ¼
echo.������Ҫ�������ļ������Ƶ�Ŀ¼����
echo.�ֶ����ĳ��㻺��Ŀ¼��·��
echo.�����ʶ�𲻵���ľ������ļ�
echo.��ϸ�뿴���ù���˵���3ѡ��
echo.      ==����˵��==
echo.����ŷ������ͬһ������Ŀ¼ע���
echo.�����ͬʱ��������������������Ҫ��������
echo.��ע�����޸ĵĻ���Ŀ¼�ǹ�������ŷ��
echo.************************
pause
cls
echo.******����Ŀ¼����******
echo.    1-�޸�EVE����Ŀ¼
echo.    2-��EVE����Ŀ¼
echo.    3-�������˵�
echo.************************
echo.
echo.����ѡ�����:  (0�˳�)
set /p idp=
if "%idp%"=="0" goto exit
if "%idp%"=="1" goto inputcachepath
if "%idp%"=="2" goto opencachefolder
if "%idp%"=="3" (
	goto mainmenu
) else (
	goto exit
)

:inputcachepath
cls
echo.     �޸�EVE����Ŀ¼
echo.**********˵��**********
echo.�����뻺��ĵ����ļ���
echo.��Ҫ���밲װĿ¼��������̷�
echo.���Ҳ�Ҫ�������һ��б��
echo.ʾ��:
echo.D:\Program Files\EVE\SharedCache
echo.D:\EVECache
echo.����:
echo.D:\Program Files\EVE
echo.D:\
echo.************************
echo.
echo.��ճ������ĵĻ���Ŀ¼·��:
set /p cachefolderpath=
echo.
echo.�������·����
echo.%cachefolderpath%
echo.
echo.ȷ������������ y ����
set /p ynp=
if "%ynp%"=="y" (
	goto changecachepath
) else (
	goto cacheman
)

:changecachepath
@reg add "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER" /t REG_SZ /d "%cachefolderpath%" /f>nul
echo.�޸ĳɹ�
pause
exit

:opencachefolder
for /f "tokens=3" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER"') do (
	set CACHEFOLDER=%%i
)
start %CACHEFOLDER%
exit

rem ������������г##########################################################
:zhpatchman
cls
echo.     ������������г
echo.**********˵��**********
echo.ʹ��ŷ����ҵ�����޸İ������ļ�
echo.�Ž������Ļ���Ŀ¼���м���
echo.��ԭ�������ݣ�����ԭ֭ԭζ��EVE
echo.
echo.������������ļ�������Ŀ¼
echo.δ�����ļ����ǣ��йط�ŷ���δ֪
echo.���е��ģ�����ʹ��
echo.************************
pause
cls
echo.*****������������г*****
echo.    1-��������г
echo.    2-�ָ���г
echo.    3-�������˵�
echo.************************
echo.
echo.����ѡ�����:  (0�˳�)
set /p idz=
if "%idz%"=="0" goto exit
if "%idz%"=="1" goto patchconfirm
if "%idz%"=="2" goto depatch
if "%idz%"=="3" (
	goto mainmenu
) else (
	goto exit
)

:patchconfirm
for /f "tokens=3" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER"') do (
	set CACHEFOLDER=%%i
)
echo.
echo.�����򲹶���EVE����Ŀ¼Ϊ
echo.
echo.%CACHEFOLDER%
echo.
echo.ȷ������������ y ����
set /p ynz=
if "%ynz%"=="y" (
	goto patch
) else (
	goto zhpatchman
)

:patch
echo.
echo.��������ŷ����������������Ŀ¼
echo.%CACHEFOLDER%\serenity\res\localizationFSD\localization_fsd_zh.ZH.pickle
echo.
curl -L https://zhpatch2.evemodx.com/download_pickle -o %CACHEFOLDER%\serenity\res\localizationFSD\localization_fsd_zh.ZH.pickle --create-dirs
echo.
echo.������ɣ���������Ϸ�鿴�Ƿ���Ч
echo.
pause
exit

:depatch
for /f "tokens=3" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER"') do (
	set CACHEFOLDER=%%i
)
del %CACHEFOLDER%\serenity\res\localizationFSD /S /Q
echo.
echo.������ɾ������������Ϸ�鿴�Ƿ�ָ�
pause
exit

rem �˳�##########################################################
:exit
echo.
echo.ȡ������
echo.
pause
exit