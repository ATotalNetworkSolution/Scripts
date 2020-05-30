REM This script gathers a directory and file listing from remote computers
REM Ver 1.2 2020-01-17
REM Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
REM Script may be modified, by credit may not be removed

IF EXIST C:\ GOTO CDrive
GOTO DDrive

:CDrive
echo This is :CDrive
C:
cd \
dir /s >> C:\Temp\C_FileListing.txt
IF EXIST D:\ GOTO DDrive
GOTO EDrive

:DDrive
echo This is :DDrive
IF EXIST D:\ GOTO DDir
GOTO EDrive
:DDir
echo This is :DDir
D:
cd \
dir /s >> C:\Temp\D_FileListing.txt
IF EXIST E:\ GOTO EDrive
GOTO FDrive

:EDrive
IF EXIST E:\ GOTO EDir
GOTO FDrive
:EDir
echo This is :EDrive
E:
cd \
dir /s >> C:\Temp\E_FileListing.txt
IF EXIST F: GOTO FDrive
GOTO GDrive

:FDrive
IF EXIST F:\ GOTO FDir
GOTO GDrive
:FDir
echo This is :FDrive
F:
cd \
dir /s >> C:\Temp\F_FileListing.txt
IF EXIST G: GOTO GDrive
GOTO HDrive

:GDrive
IF EXIST G:\ GOTO GDir
GOTO HDrive
:GDir
echo This is :GDrive
G:
cd \
dir /s >> C:\Temp\G_FileListing.txt
IF EXIST H: GOTO HDrive
GOTO IDrive

:HDrive
IF EXIST H:\ GOTO HDir
GOTO IDrive
:HDir
echo This is :HDrive
H:
cd \
dir /s >> C:\Temp\H_FileListing.txt
IF EXIST I: GOTO IDrive
GOTO JDrive

:IDrive
IF EXIST I:\ GOTO IDir
GOTO JDrive
:IDir
echo This is :IDrive
I:
cd \
dir /s >> C:\Temp\I_FileListing.txt
IF EXIST J: GOTO JDrive
GOTO KDrive

:JDrive
IF EXIST J:\ GOTO JDir
GOTO KDrive
:JDir
echo This is :JDrive
J:
cd \
dir /s >> C:\Temp\J_FileListing.txt
IF EXIST K: GOTO KDrive
GOTO LDrive

:KDrive
IF EXIST K:\ GOTO KDir
GOTO LDrive
:KDir
echo This is :KDrive
K:
cd \
dir /s >> C:\Temp\K_FileListing.txt
IF EXIST L: GOTO LDrive
GOTO MDrive

:LDrive
IF EXIST L:\ GOTO LDir
GOTO MDrive
:LDir
echo This is :LDrive
L:
cd \
dir /s >> C:\Temp\L_FileListing.txt
IF EXIST M: GOTO MDrive
GOTO NDrive

:MDrive
IF EXIST M:\ GOTO MDir
GOTO NDrive
:MDir
echo This is :MDrive
M:
cd \
dir /s >> C:\Temp\M_FileListing.txt
IF EXIST N: GOTO NDrive
GOTO ODrive

:NDrive
IF EXIST N:\ GOTO NDir
GOTO ODrive
:NDir
echo This is :NDrive
N:
cd \
dir /s >> C:\Temp\N_FileListing.txt
IF EXIST O: GOTO ODrive
GOTO PDrive

:ODrive
IF EXIST O:\ GOTO ODir
GOTO PDrive
:ODir
echo This is :ODrive
O:
cd \
dir /s >> C:\Temp\O_FileListing.txt
IF EXIST P: GOTO PDrive
GOTO QDrive

:PDrive
IF EXIST P:\ GOTO PDir
GOTO QDrive
:PDir
echo This is :PDrive
P:
cd \
dir /s >> C:\Temp\P_FileListing.txt
IF EXIST Q: GOTO QDrive
GOTO RDrive

:QDrive
IF EXIST Q:\ GOTO QDir
GOTO RDrive
:QDir
echo This is :QDrive
Q:
cd \
dir /s >> C:\Temp\Q_FileListing.txt
IF EXIST R: GOTO RDrive
GOTO SDrive

:RDrive
IF EXIST R:\ GOTO RDir
GOTO SDrive
:RDir
echo This is :RDrive
R:
cd \
dir /s >> C:\Temp\R_FileListing.txt
IF EXIST S: GOTO SDrive
GOTO TDrive

:SDrive
IF EXIST S:\ GOTO SDir
GOTO TDrive
:SDir
echo This is :SDrive
S:
cd \
dir /s >> C:\Temp\S_FileListing.txt
IF EXIST T: GOTO TDrive
GOTO UDrive

:TDrive
IF EXIST T:\ GOTO TDir
GOTO UDrive
:TDir
echo This is :TDrive
T:
cd \
dir /s >> C:\Temp\T_FileListing.txt
IF EXIST U: GOTO UDrive
GOTO VDrive

:UDrive
IF EXIST U:\ GOTO UDir
GOTO VDrive
:UDir
echo This is :UDrive
U:
cd \
dir /s >> C:\Temp\U_FileListing.txt
IF EXIST V: GOTO VDrive
GOTO WDrive

:VDrive
IF EXIST V:\ GOTO VDir
GOTO WDrive
:VDir
echo This is :VDrive
V:
cd \
dir /s >> C:\Temp\V_FileListing.txt
IF EXIST W: GOTO WDrive
GOTO XDrive

:WDrive
IF EXIST W:\ GOTO WDir
GOTO XDrive
:WDir
echo This is :WDrive
W:
cd \
dir /s >> C:\Temp\W_FileListing.txt
IF EXIST X: GOTO XDrive
GOTO YDrive

:XDrive
IF EXIST X:\ GOTO XDir
GOTO YDrive
:XDir
echo This is :XDrive
X:
cd \
dir /s >> C:\Temp\X_FileListing.txt
IF EXIST Y: GOTO YDrive
GOTO ZDrive

:YDrive
IF EXIST Y:\ GOTO YDir
GOTO ZDrive
:YDir
echo This is :YDrive
Y:
cd \
dir /s >> C:\Temp\Y_FileListing.txt
IF EXIST Z: GOTO ZDrive
GOTO End

:ZDrive
IF EXIST Z:\ GOTO ZDir
GOTO END
:ZDir
echo This is :ZDrive
Z:
cd \
dir /s >> C:\Temp\Z_FileListing.txt
GOTO End

:END
@ECHO OFF
CLS
Echo.
Echo.
Echo Directory listing has been done, results saved in C:\Temp in file name starting with first letter of the drive.
Echo.
pause
