Get-Service
""
Get-Service -Name Spooler
""
Get-Service -DisplayName Hora*
""
Get-Service | Where-Object {$_.Status -eq "Running"}
""
Get-Service| 
>> Were-Object {$_.StartType -eq "Automatic"}|
>> Select-Object Name, StartType
""

Get-Service -DependeServices Spooler
""
Get-Service -RequiredServices Fax
""

Stop-Service-Name Spooler -Confirm -PassThru
""
Suspend-Service -Name stisvc -Confirm -PassThru
""
Get-Service | Where-Object CanPauseAndContinue -eq True
""
Suspend-Service -Name Spooler
""
Restart-Service -Name WSearch -Confirm -PassThru
""
Set-Service -Name dsvc -DisplayName "Servicio de virtualizacion de credenciales de credenciañes de seguridad distribuidas"
""
Set-Service Name BITS -StartupType Automatic -Confirm -PassThru | Select-Object Name, StartType
""
Set-Service -Name BITS -Description "Transfiere archivos en segundo plano mediantye el uso de ancho de banda de red inactivo"
""
Get-CimInstancce Win32_Service -Filter ´Name = "BITS"´|Format-List Name, Description
""
Set-Service -Name Spooler -Status Running -Confirm -PassThru
""
Set-Service -Name Stivs -Status Paused -Confirm -PassThru
""
Set-Service -Name BITS Status Stooped -Confirm -PassThru
