Write-Host "Menú del Servidor DNS:"
Write-Host "1. Configurar Servidor DNS"
Write-Host "2. Salir"
$option = Read-Host "Ingrese su opción"

if ($option -eq "1") {
    .\dns_logic.ps1
} elseif ($option -eq "2") {
    Write-Host "Saliendo..."
} else {
    Write-Host "Opción no válida."
}
