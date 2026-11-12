#!/bin/bash

if [ -z "$1" ]; then
	echo "Uso: $0 <dominio>"
	echo "Exemplo: $0 debian.org"
	exit 1
fi

DOMINIO="$1"

echo "=== Mapeamento DNS para: $DOMINIO ==="

echo "[+] Endereço(s) IP (Registro A) :"
dig +short "$DOMINIO" A

echo ""

echo "[+] Servidor(es) de Email (Registro MX) :"
dig +short "$DOMINIO" MX
