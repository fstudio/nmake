####USE CMD Build
#NMAKE Makefile.
TARGET=nmake_new.exe
CC=cl
LINK=link
RC=rc
CFLAGS=/TC    -W3  -Zc:forScope -Zc:wchar_t -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -MT
CXXFLAGS=/TP   -W3 -EHsc -Zc:forScope -Zc:wchar_t -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -MT
LDFLAGS=/NOLOGO -OPT:REF
LIBRARY=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib 
COBJS=getrcmsg.obj
CXXOBJS=action.obj build.obj charmap.obj command.obj  error.obj exec.obj \
file.obj globals.obj ifexpr.obj init.obj  inline.obj lexer.obj macro.obj nmake.obj parser.obj print.obj \
rpn.obj rule.obj util.obj utilp.obj 
RESOURCES=nmake.res


all:$(TARGET)

$(TARGET): $(CXXOBJS) $(COBJS)  $(RESOURCES)
	$(LINK) $(LDFLAGS)  -OUT:$@ $** $(LIBRARY)

	
.rc.res:
	$(RC) $(RFLAGS) /r $<
	
{.}.c.obj::
	$(CC) $(CFLAGS) -c $<

{.}.cpp.obj::
	$(CC) $(CXXFLAGS) -c $<

{.}.cc.obj::
	$(CC) $(CXXFLAGS) -c $<


clean:
	@-if exist *.obj del /s /q *.obj >nul 2>nul
	@-if exist *.exe  del /s /q *.exe >nul 2>nul
	@-if exist *.res del /s /q *.res >nul 2>nul