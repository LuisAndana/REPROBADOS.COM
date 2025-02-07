Get-Process
""
Get-Process -Name Acrobat
""
Get-Process -Name Search*
""
Get-Process -Name Search*
""
Get-Process -Id 13948
""
Get-Process WINDWORD -FileVersionInfo
""
Get-Process WINDWORD -IncludeUserName
""
Get-Process WINDWORD -Module
""
Stop process -Name Acrobat -Confirm -Passthru
""
Stop process -Id 10940 -Confirm -Passthru
""
Stop process -Name Acrobat | Stop-Process -Confirm -PassThru
""
Start-Process -FilePath "c:\WINDOWS\System32\notepad.exe" -PassThru
""
Start-Process -FilePath "cmd.exe" -ArgumentList "/C mkdir NuevaCarpeta" -WorkingDirectory "D:\Documents\FIC\Q6\ASO" -PassThru
""
Start-Process -FilePath "notepad.exe" -WindowStyle "Maximized" -PassThru
""
Start-Process -FilePath "D:\Documents\FIC\Q6\ASO\TT\TT.txt" -Verb Print -PassThru
""
Get-Process -Name noted*
""
Wait-Process -Name notepad*
""
Get-Process -Name noted*
""
Wait-Process -Id 11568
Get-Pocess -Name notep*
""

Get-Process -Name notep*
Get-Process -Name notepad | Wait-Process

