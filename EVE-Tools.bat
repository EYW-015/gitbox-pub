@echo off
:mainmenu
cls
echo.   欢迎使用EVE小工具集
echo.   本工具集作者：EYW
echo.
echo.**********菜单**********
echo.   1-EVE配置备份恢复
echo.   2-修改EVE缓存目录
echo.   3-国服汉化反和谐
echo.************************
echo.
echo.输入选项序号:  (0退出)
set /p idm=
if "%idm%"=="0" goto exit
if "%idm%"=="1" goto cfgman
if "%idm%"=="2" goto cacheman
if "%idm%"=="3" (
	goto zhpatchman
) else (
	goto exit
)

rem 配置文件管理##########################################################
:cfgman
cls
echo.     EVE配置文件管理
echo.**********说明**********
echo.EVE配置文件包含各个
echo.显示设置，各人物总体设定
echo.游戏内窗口大小，位置
echo.总览，等等一系列设置内容
echo.************************
pause
cls
echo.     EVE配置文件管理
echo.******配置文件管理******
echo.    1-备份配置文件
echo.    2-恢复配置文件
echo.    3-打开配置目录
echo.	(手动修改及说明)
echo.    4-返回主菜单
echo.************************
echo.
echo.输入选项序号:  (0退出)
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
echo.**********说明**********
echo.如需备份配置文件
echo.先将本文件找个地方放
echo.配置文件会备份在相同目录下
echo.************************
pause
xcopy %LOCALAPPDATA%\CCP\EVE EVEcfg /s/i/q/y
pause
exit

:restorecfg
cls
echo.**********说明**********
echo.如需恢复备份的配置文件
echo.将配置文件夹命名为"EVEcfg"
echo.与本文件放在一起，然后运行即可
echo.************************
pause
xcopy EVEcfg %LOCALAPPDATA%\CCP\EVE /s/i/q/y
pause
exit

:opencfg
cls
echo.**********说明**********
echo.配置文件存储文件夹是名字最长的几个
echo.配置文件夹名称格式为
echo.(缓存目录)_serenity_serenity.evepc.163.com
echo.
echo.例如缓存目录在
echo.D:\Program Files\EVE\SharedCache
echo.那么国服的配置文件就在
echo.d_program_files_eve_shaedcache_serenity_serenity.evepc.163.com
echo.全小写，斜杠和空格换成下划线
echo.************************
pause
start %LOCALAPPDATA%\CCP\EVE
pause
exit

rem 修改EVE缓存目录##########################################################
:cacheman
cls
echo.     EVE缓存目录管理
echo.**********说明**********
echo.如果你更改了缓存目录
echo.那你需要将配置文件夹名称的目录部分
echo.手动更改成你缓存目录的路径
echo.否则会识别不到你的旧配置文件
echo.详细请看配置管理菜单第3选项
echo.      ==附加说明==
echo.国服欧服共享同一个缓存目录注册表
echo.如果你同时玩两个服务器，并且需要分离启动
echo.请注意你修改的缓存目录是国服还是欧服
echo.************************
pause
cls
echo.******缓存目录管理******
echo.    1-修改EVE缓存目录
echo.    2-打开EVE缓存目录
echo.    3-返回主菜单
echo.************************
echo.
echo.输入选项序号:  (0退出)
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
echo.     修改EVE缓存目录
echo.**********说明**********
echo.请输入缓存的单独文件夹
echo.不要输入安装目录或仅输入盘符
echo.并且不要输入最后一个斜杠
echo.示例:
echo.D:\Program Files\EVE\SharedCache
echo.D:\EVECache
echo.错误:
echo.D:\Program Files\EVE
echo.D:\
echo.************************
echo.
echo.请粘贴想更改的缓存目录路径:
set /p cachefolderpath=
echo.
echo.你输入的路径是
echo.%cachefolderpath%
echo.
echo.确认无误请输入 y 继续
set /p ynp=
if "%ynp%"=="y" (
	goto changecachepath
) else (
	goto cacheman
)

:changecachepath
@reg add "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER" /t REG_SZ /d "%cachefolderpath%" /f>nul
echo.修改成功
pause
exit

:opencachefolder
for /f "tokens=3" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER"') do (
	set CACHEFOLDER=%%i
)
start %CACHEFOLDER%
exit

rem 国服汉化反和谐##########################################################
:zhpatchman
cls
echo.     国服汉化反和谐
echo.**********说明**********
echo.使用欧服玩家的民间修改版语言文件
echo.放进国服的缓存目录进行加载
echo.还原汉化内容，享受原汁原味的EVE
echo.
echo.本方法仅添加文件进缓存目录
echo.未进行文件覆盖，有关封号风险未知
echo.如有担心，请勿使用
echo.************************
pause
cls
echo.*****国服汉化反和谐*****
echo.    1-汉化反和谐
echo.    2-恢复和谐
echo.    3-返回主菜单
echo.************************
echo.
echo.输入选项序号:  (0退出)
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
echo.即将打补丁的EVE缓存目录为
echo.
echo.%CACHEFOLDER%
echo.
echo.确认无误请输入 y 继续
set /p ynz=
if "%ynz%"=="y" (
	goto patch
) else (
	goto zhpatchman
)

:patch
echo.
echo.正在下载欧服汉化补丁到缓存目录
echo.%CACHEFOLDER%\serenity\res\localizationFSD\localization_fsd_zh.ZH.pickle
echo.
curl -L https://zhpatch2.evemodx.com/download_pickle -o %CACHEFOLDER%\serenity\res\localizationFSD\localization_fsd_zh.ZH.pickle --create-dirs
echo.
echo.下载完成，请运行游戏查看是否生效
echo.
pause
exit

:depatch
for /f "tokens=3" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\CCP\EVEONLINE" /v "CACHEFOLDER"') do (
	set CACHEFOLDER=%%i
)
del %CACHEFOLDER%\serenity\res\localizationFSD /S /Q
echo.
echo.补丁已删除，请运行游戏查看是否恢复
pause
exit

rem 退出##########################################################
:exit
echo.
echo.取消操作
echo.
pause
exit