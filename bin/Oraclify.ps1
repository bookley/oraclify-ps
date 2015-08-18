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
                                            $line = $_
                                            $propertyPattern = '^(\s*)public\s(\S*)\s(\S*)\s\{ get; set; \}'
                                            $classPattern = '^(\s*)public partial class (\S*)'
                                            $classReplacePattern = "`$1[Table(`"`$2`")]`r`n`$1public partial class `$2"

                                            if($line -match $propertyPattern){
                                                [Regex]::Replace($line, $propertyPattern, {
                                                    param($m)
                                                    $m.Groups[1].Value + '[Column("' + $m.Groups[3].Value.ToUpper() + "`")]`r`n" + 
                                                    $m.Groups[1].Value + "public " + $m.Groups[2] + " " + $m.Groups[3].Value + " { get; set; }"
                                                })
                                                
                                            }
                                            elseif($line -match $classPattern){
                                                [Regex]::Replace($line, $classPattern, {
                                                    param($m)
                                                    $m.Groups[1].Value + '[Table("' + $m.Groups[2].Value.ToUpper() + "`")]`r`n" + 
                                                    $m.Groups[1].Value + "public partial class " + $m.Groups[2]
                                                })
                                            } 
                                            else {
                                                echo $line
                                            }
                                         } | Set-Content $FileName