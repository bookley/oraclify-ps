cd /d %~dp0
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.11.0\shell\Oraclify
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.11.0\shell\Oraclify\command /ve /d "\"%cd%\bin\Oraclify.bat\" \"%%1\"" /f

%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.10.0\shell\Oraclify
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.10.0\shell\Oraclify\command /ve /d "\"%cd%\bin\Oraclify.bat\" \"%%1\"" /f

%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.12.0\shell\Oraclify
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.12.0\shell\Oraclify\command /ve /d "\"%cd%\bin\Oraclify.bat\" \"%%1\"" /f

%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.14.0\shell\Oraclify
%SystemRoot%\System32\reg.exe add HKEY_CLASSES_ROOT\VisualStudio.cs.14.0\shell\Oraclify\command /ve /d "\"%cd%\bin\Oraclify.bat\" \"%%1\"" /f