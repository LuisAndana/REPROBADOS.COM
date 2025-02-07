Get-LocalUser
""
Get-LocalUser -Name Miguel | Select-Object
""
Get-LocalUser -SID S-1-5-21-619924196-4045554399-1956444398-500 | Select-Object*
""
Get-LocalGroup
""
Get-LocalGroup -Name Administradores | Select-Object *
""
Get-LocalGroup -SID S-1-5-32-545 | Select-Object
""
New-LocalUsers -Name "Usuarios1"-Description "Usuarios de prueba 1" -NoPassword
""
New-LocalUser -Name "usuarios2" -Description "Usuarios de prueba 2" -Password (ConvertTo-SecureString-AsPlainText "12345"-Force)
""
Get-LocalUser
""
Remove-LocalUser -Name "Usuarios1"
Get-LocalUser -Name "Usuarios1" 
Get-LocalUser -Name "Usuarios2"
Get-LocalUser -Name "Usuarios2" | Remove-LocalUser
Get-LocalUser -Name "Usuarios2"
""
Name-LocalGroup -Name 'Grup1' -Description 'Grupo de pruba 1'
""
Add-LocalGroupMember -Group Grupo1 -Member Usuario2 -Verbose
""
Get-LocalGroupMember Grupo1
""
Remove-LocalGroupMember -Grupo1 -Member Usuario1
Remove-LocalGroupMember -Grupo1 -Member Usuario2
Get-LocalGroupMember -Grupo1
""
Get-LocalGroup -Name "Grupo1"
""
Remove-LocalGroup -Name "Grupo1"
Get-LocalGroup -Name "Grupo1"


