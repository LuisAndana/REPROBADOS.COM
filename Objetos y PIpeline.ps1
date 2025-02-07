Get-Service -Name "LSM" | Get-Member
Get-Service -Name "LSM" | Get-Member -MemberType Property
Get-Service -Name "LSM" | Get-Member -MemberType Method
Get-Item .\test.txt | Select-Object Name, Length
Get-Service | Select-Object -Last 5
Get-Service | Select-Object -First 5
Get-Service | Where-Object {$_.Status -eq "Running"}
""
(Get-Item.\test.txt).IsReadOnly = 1
(Get-Item.\test.txt).IsReadOnly


Get-ChildItem *.txt

$miobjeto = New-Object PSObject
$miobjeto |Add-Member -MemberType NoteProperty -Name Nombre -Value "Miguel"
$miobjeto |Add-Member -MemberType NoteProperty -Name Edad -Value 23
$miobjeto |Add-Member -MemberType NoteProperty -Name Saludar -Value {Write-Host "¡Hola Mundo!"}
""
$miobjeto = New-Object -TypeName PSObject -Property @{
>> Nombre = "Miguel"
>> Edad = 23
>> }
$miobjeto | Add-Member -MemberType ScriptMethod -Name Saludar -Value {Write-Host "¡Hola Mundo"}
$miobjeto | Get-Member


$miobjeto = [PSCustomObject] @{
>> Nombre = "Miguel"
>> Edad = 23
>> }
$miobjeto | Add-Member -MemberType ScriptMethod -Name Saludar -Value {Write-Host "¡Hola Mundo"}
$miobjeto | Get-Member

Get-Process -Name Acrobat | Stop-Process
Get-Help -Full Get-Process
Get-Help -Full Stop-Process
Get-Process
Get-Process -Name Acrobat | Stop-Process
Get-Help -Full Get-ChildItem
Get-Help -Full Get-Clipboard
Get-childItem *.txt | Get-Clipboard
Get-Help -Full Stop-Service
Get-Service
Get-Service Spooler | Stop-Service
"Spooler" | Stop.Service
""
Get-Service
$miobjeto = [PSCustom] @{
>> Name = "Spooler"
>> }
Get-Service
Get-Service
