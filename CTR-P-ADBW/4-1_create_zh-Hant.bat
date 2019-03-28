PUSHD "%~dp0"
tools\3dstool -cvtf banner build\cxi0\exefs\banner.bnr --banner-dir build\cxi0\exefs\banner
tools\3dstool -cvtfz exefs build\cxi0\exefs.bin --header build\cxi0\exefs\exefsheader.bin --exefs-dir build\cxi0\exefs
REM tools\3dstool -cvtf romfs build\cxi0\romfs.bin --romfs-dir build\cxi0\romfs --romfs cci\cxi0\romfs.bin
REM MD build\cfa7
REM tools\3dstool -cvtf romfs build\cfa7\romfs.bin --romfs-dir cci\cfa7\romfs --romfs cci\cfa7\romfs.bin
REM tools\3dstool -cvtf cxi build\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.darc.lz --plain cci\cxi0\plain.bin --exefs build\cxi0\exefs.bin --romfs build\cxi0\romfs.bin
tools\3dstool -cvtf cxi build\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.darc.lz --plain cci\cxi0\plain.bin --exefs build\cxi0\exefs.bin --romfs cci\cxi0\romfs.bin
REM tools\3dstool -cvtf cfa build\7.cfa --header cci\cfa7\ncchheader.bin --romfs build\cfa7\romfs.bin
REM tools\3dstool -cvt07f cci build\0.cxi build\7.cfa "Nintendogs + Cats - French Bulldog & New Friends (TWN) (zh-Hant).3ds" --header cci\ncsdheader.bin
tools\3dstool -cvt07f cci build\0.cxi cci\7.cfa "Nintendogs + Cats - French Bulldog & New Friends (TWN) (zh-Hant).3ds" --header cci\ncsdheader.bin
IF NOT "%~1"=="" (
tools\3dstool --diff -vt cci --old "%~1" --new "Nintendogs + Cats - French Bulldog & New Friends (TWN) (zh-Hant).3ds" --patch-file patch.3ps
tools\icn2ico cci\cxi0\exefs\icon.icn zh\icon.ico
CALL make_3ps_exe.bat zh\icon.ico patch.3ps zh-Hant_ADBWTOOLS || CALL ..\exepatch\make_3ps_exe.bat zh\icon.ico patch.3ps zh-Hant_ADBWTOOLS
DEL zh\icon.ico
)
POPD
