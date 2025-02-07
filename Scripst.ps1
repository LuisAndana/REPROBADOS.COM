cat.\try-cath.ps1
try
{
    Write-Output "Todo bien"
}
catch
{
    Write-Output "Algo lanzo una excepcion"
    Write-Output $_
}
Try
{
    Start-Somethings -ErrorAction Stop
}
catch
{
    Write-Output "Algo genero una exepcion o uso Write-Error"
    Write-Output $_
}
.\try-catch.ps1



cat .\try-catch.ps1
""
.\try-catch.ps1
""
$comando= [System.Data.SqlClient.SqlVCommand]::New(queryString, connection)
try
{
    $comando.Connection.Open()
    $comando.ExecuteQuery()
}
finally
{
    Write-Error "Ha habido un problema con le ejecucion de la query. Cerrrando la conexion"
    $commando.Connection.Close()
}
""
try
{
    Start-Something -path $path -ErrorAction Stop
}
catch [System.IO.DirectoryNotFoundException],[system.IO.File.NotFoundException]
{
    Write-Output "El directorio o fichero no ha sido encontrado [Path]"
}
catch [System.IO.Exeption]
{
    Write-Output "Error IO con el archivo:[$path]"
}
""
Throw "No se puede encontrar la ruta: [$path]"

Throw [System.IO.FileNotFoundException] "No se puede encontar la ruta [$path]"
Throw [System.IO.FileNotFoundException]::new()

Throw [System.IO.FileNotFoundException]::new("No se puede encontar la ruta[$path]")

Throw (New-Object -TypeName System.IO.FileNotFoundException)

Throw (New-Object -TypeName System.IO.FileNotFoundException -ArgumentList "No se puede encontar la ruta: [$path]")
""

cat.\trap.ps1
trap
{
    Write-Output $PSItem.ToString()
}
Throw [System.Exception]::new('primero')
Throw [System.Exception]::new('segundo')
Throw [System.Exception]::new('tercero')
.\trap.ps1
""

functions Backuo-Registry {
Param(
    [Parameter(Mandatary = $true)]
    [string]$rutaBackup

)

#Crear la ruta de destino del backup si no existe
if(¡(Test-Path -Path $rutaBackup)) {
    New-Item -ItemType Directiry -Path $rutaBackup | Out-Null
    }

#Generar un nombre unico para el archivo de backup

$nombreArchivo = "Backup-Registry_" + (Gate-Date -Format "yyyy-MM-dd-mm-ss") + ".reg"
    $rutaArchivo =Join-Path -Path $rutaBackup -ChildPath $nombreArchivo

#Realizar el backup del registro del sistema guardado en el archivo de destino
    try {
        Write-Host "Realizando el backup del registro del sistema en $rutaArchivo..."
        reg export HKLM $rutaArchivo
        Write-Host "El backup del registro del sistema se ha realizado con exito."
        }
        catch {
            Write-Host "se ha producido un error al realizar el backup del registro del sistema $_"
            }
}

# Escribir en el archivo log
$logDirectory = "$env:APPDATA\RegistryBackup"
$logFile = Join-Path $logDirectory "backup-registry_log.txt"
$logEntry = "$(Get-Date) - $env:USERNAME - Backup -
$backupPath"
    if(¡(Test-Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory | Out-Null
    }
    Add-Content -Path $logFile -Value $logEntry

""
#Verificar si hay mas de $backups en el directorio y eliminar los mas antiguos si es necesario
    $backupPath=10
    $backups = Get-ChildItem $backupDirectory -Filter *.reg | Sport-Object LasWriteTime -Descending
        if ($backups.Count -gt $backupCount {
        $backupsToDelet = $bakaup[$backupCount..($bakaups.Count -1)]

        $backupToDelete | Remove-Item -Force
    }

@{ 
    ModuleVersion = '1.0.0' 
    PowerShellVersion = '5.1' 
    RootModule = 'Backup-Registry.ps1' 
    Description = 'Módulo para realizar backups del registro del 
sistema de Windows' 
    Author = 'Alice' 
    FunctionsToExport = @('Backup-Registry') 
} 
ls

Import-Module BackRegistry
""

Get-Help Backup-Registry

Backup-Registry -rutaBackup 'D:\tmp\Backups\Registro\'
ls.\tmp\Backups\Registro\

PS C:\Program Files\WindowsPowerShell\Modules\BackupRegistry> vim .\Backup-Registry.ps1
PS C:\Program Files\WindowsPowerShell\Modules\BackupRegistry> Import-Module BackupRegistry -Force
PS C:\Program Files\WindowsPowerShell\Modules\BackupRegistry> Backup-Registry -rutaBackup 'D:\tmp\Backups\Registro\'

ls 'D:\tmp\Backups\Registro\' 

# Configuración de la tarea 
$Time = New-ScheduledTaskTrigger -At 02:00 -Daily 
# Acción de la tarea 
$PS = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument 
"-Command `"Import-Module BackupRegistry -Force; Backup-Registry 
rutaBackup 'D:\tmp\Backups\Registro'`"" 
# Crear la tarea programada 
Register-ScheduledTask -TaskName "Ejecutar Backup del Registro del 
Sistema" -Trigger $Time -Action $PS

ls 'tmp\Backups\Registro\'
Gate-Date
ls'D:\tmp\Backups\Registro'

Get-ScheduledTask 'Ejecutar Backup del registro del sistema'
Get-ScheduledTask
 




