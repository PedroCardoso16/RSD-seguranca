#!/bin/bash

echo "=== DIAGNÓSTICO DE INTERFACES DE REDE ==="

ip -o link show | awk -F': ' '{print $2}' | while read -r IFACE; do

    STATUS=$(ip link show "$IFACE" | grep -oP 'state \K[A-Z]+')

    IP=$(ip -4 addr show "$IFACE" | grep -oP 'inet \K[0-9./]+')

    if [ -n "$IP" ]; then
        echo "[+] Interface: $IFACE | IP: $IP | Status: $STATUS"
    fi
done
