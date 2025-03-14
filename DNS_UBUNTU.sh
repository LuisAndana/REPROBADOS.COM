#!/bin/bash

# Instalar BIND9
apt update && apt install -y bind9 bind9utils bind9-doc

# Pedir configuración de red
read -p "Introduce la interfaz de red (ej. eth0): " interfaz
read -p "Introduce la dirección IP (ej. 192.168.1.75): " ip_address
read -p "Introduce la máscara de red (ej. 24): " mask
read -p "Introduce la puerta de enlace (ej. 192.168.1.1): " gateway
read -p "Introduce el servidor de nombres (ej. 192.168.1.1): " nameserver

# Configurar Netplan en /etc/netplan/50-cloud-init.yaml
cat <<EOF > /etc/netplan/50-cloud-init.yaml
network:
    ethernets:
        $interfaz:
            dhcp4: false
            addresses: [$ip_address/$mask]
            routes:
                - to: default
                  via: $gateway
            nameservers:
                addresses: [$nameserver]
    version: 2
EOF

# Aplicar la configuración de Netplan
netplan apply

# Configurar named.conf
cat <<EOF > /etc/bind/named.conf
// Archivo de configuración de BIND
include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";

zone "reprobados.com" IN {
    type master;
    file "/etc/bind/conf.reprobadosandana.com";
};
EOF

# Configurar named.conf.options
cat <<EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    listen-on { any; };
    allow-query { any; };
    recursion yes;

    dnssec-validation no;

    listen-on-v6 { any; };
    forwarders {
        0.0.0.0;
        0.0.4.4;
    };
};