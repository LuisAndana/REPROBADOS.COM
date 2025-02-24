Write-Host "Seleccione el servidor a configurar:"
Write-Host "1. Servidor DNS"
Write-Host "2. Servidor DHCP"
$option = Read-Host "Ingrese su opción"

if ($option -eq "1") {
    .\dns_main.ps1
} elseif ($option -eq "2") {
    .\dhcp_main.ps1
} else {
    Write-Host "Opción no válida. Saliendo..."
}
