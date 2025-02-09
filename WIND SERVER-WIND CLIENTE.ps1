# ==============================
# Configuración del Servidor DNS
# ==============================

# 1. Verificar si el servidor DNS y herramientas están instaladas
Get-WindowsFeature DNS

# 2. Instalar el servidor DNS si no está presente
Add-WindowsFeature -Name DNS

# 3. Instalar herramientas de administración de DNS
Add-WindowsFeature -Name RSAT-DNS-Server -IncludeManagementTools

# 4. Verificar las herramientas de DNS disponibles
help add-dnsserver*

# ==============================
# Configuración de la Zona DNS
# ==============================

# 5. Listar zonas existentes en el servidor
Get-DnsServerZone

# 6. Crear la zona primaria para "reprobados.com"
Add-DnsServerPrimaryZone -Name reprobados.com -ZoneFile reprobados.com.dns

# 7. Verificar que la zona se haya creado correctamente
Get-DnsServerZone

# ==============================
# Agregar Registros DNS
# ==============================

# 8. Agregar un registro A para "reprobados.com" 
Add-DnsServerResourceRecordA -IPv4Address 192.168.1.79 -Name "@" -ZoneName reprobados.com


# 10. Verificar que el registro A se haya agregado correctamente
Get-DnsServerResourceRecord -ZoneName reprobados.com

# ==============================
# Permitir Ping en el Servidor
# ==============================

# 11. Habilitar reglas de Firewall para permitir ICMP (Ping)
New-NetFirewallRule -DisplayName "Allow ICMPv4" -Protocol ICMPv4 -Direction Inbound -Action Allow

# ==============================
# Configuración Final
# ==============================

# 12. Limpiar caché de DNS en el servidor
Clear-DnsServerCache

# 13. Reiniciar el servicio DNS para aplicar los cambios
Restart-Service DNS