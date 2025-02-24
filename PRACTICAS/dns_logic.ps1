# Asegurarse de que el servidor DHCP está instalado
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# Función para validar una dirección IP
function Validate-IPAddress {
    param (
        [string]$ip
    )
    return $ip -match "^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$" -and ($matches[1..4] -notmatch "[^0-9]") -and ($matches[1..4] -match "^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])$")
}

# Función para validar máscara de subred
function Validate-SubnetMask {
    param (
        [string]$mask
    )
    $validMasks = @("255.255.255.0", "255.255.254.0", "255.255.252.0", "255.255.248.0", "255.255.240.0", "255.255.224.0", "255.255.192.0", "255.255.128.0", "255.255.0.0")
    return $validMasks -contains $mask
}

# Solicitar la información para la configuración del DHCP con validaciones
$scopeId = Read-Host "Introduce el ID del alcance (por ejemplo, 192.168.0.0)"
while (-not (Validate-IPAddress $scopeId)) {
    $scopeId = Read-Host "Error: Introduce un ID de alcance válido (ejemplo: 192.168.0.0)"
}

$startIP = Read-Host "Introduce la IP de inicio del rango (por ejemplo, 192.168.0.100)"
while (-not (Validate-IPAddress $startIP)) {
    $startIP = Read-Host "Error: Introduce una IP válida para inicio del rango"
}

$endIP = Read-Host "Introduce la IP final del rango (por ejemplo, 192.168.0.200)"
while (-not (Validate-IPAddress $endIP)) {
    $endIP = Read-Host "Error: Introduce una IP válida para final del rango"
}

$subnetMask = Read-Host "Introduce la máscara de subred (por ejemplo, 255.255.255.0)"
while (-not (Validate-SubnetMask $subnetMask)) {
    $subnetMask = Read-Host "Error: Introduce una máscara de subred válida"
}

$router = Read-Host "Introduce la IP del router (por ejemplo, 192.168.0.1)"
while (-not (Validate-IPAddress $router)) {
    $router = Read-Host "Error: Introduce una IP de router válida"
}

# Verificar si el alcance DHCP ya existe
$existingScope = Get-DhcpServerv4Scope | Where-Object {$_.ScopeId -eq $scopeId}

if ($existingScope) {
    Write-Host "El alcance DHCP ya existe: $scopeId"
} else {
    # Crear el alcance DHCP si no existe
    Write-Host "Creando el alcance DHCP: $scopeId"
    Add-DhcpServerv4Scope -Name "Rango de IPs $scopeId" -StartRange $startIP -EndRange $endIP -SubnetMask $subnetMask
}

# Configurar las opciones del alcance 
Write-Host "Configurando el router para el alcance $scopeId"
Set-DhcpServerv4OptionValue -ScopeId $scopeId -Router $router

# Verificar los alcances DHCP
Write-Host "Obteniendo los alcances DHCP..."
Get-DhcpServerv4Scope

# Verificar las concesiones (leases) DHCP
Write-Host "Obteniendo las concesiones DHCP..."
Get-DhcpServerv4Lease

# Reiniciar el servicio DHCP
Write-Host "Reiniciando el servicio DHCP..."
Restart-Service DHCPServer

Write-Host "Configuración completada."

# Verificar el estado del DHCP
Get-WindowsFeature -Name DHCP