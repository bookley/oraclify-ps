cd /d %~dp0
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.11.0\shell\Oraclify
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.11.0\shell\Oraclify\command /ve /d "%cd%\bin\Oraclify.bat %%1" /f