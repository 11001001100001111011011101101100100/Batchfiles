xcopy c:\"program files (x86)"\pstools\psloglist.exe \\%1\c$\windows\system32\
psexec \\%1 -u Domain\username psloglist -d 5 > LOG.txt 

