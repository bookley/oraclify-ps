<#
.SYNOPSIS
Formats a .CS (C-Sharp file) entity file to make it suitable for Oracle
.DESCRIPTION
Given a .CS file, inserts the appropriate annotations to allow renaming of
the class and properties, while ensuring it still works with Oracle
.PARAMETER FileName
The name of the file to Oraclify
.EXAMPLE
Oraclify -FileName example.cs
#>
param(
[Parameter(Mandatory=$true)][string]$FileName
)
(Get-Content $FileName) | ForEach-Object { 
                                            $_ -replace '^(\s*)public\s(\S*)\s(\S*)\s\{ get; set; \}', "`$1[Column(`"`$3`")]`r`n`$1public `$2 `$3 { get; set; }" `
                                            -replace '^(\s*)public partial class (\S*)', "`$1[Table(`"`$2`")]`r`n`$1public partial class `$2"
                                         } | Set-Content $FileName