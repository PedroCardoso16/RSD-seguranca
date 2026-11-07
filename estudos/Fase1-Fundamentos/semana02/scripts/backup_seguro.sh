#!/bin/bash

if [ -z "$1" ]; then
    excho "Uso: $0 <diretorio_para_backup>"
    exit 1
fi

ALVO=$1
DESTINO="/tmp/backups"
DATA=$(date '+%Y-%m-%d_%H%M%S')
NOME_BACKUP="backup_$(basename $ALVO)_$DATA.tar.gz"

mkdir -p $DESTINO

echo "[*] A iniciar backup de $ALVO..."

tar -czf "$DESTINO/$NOME_BACKUP" "$ALVO" 2>/dev/null # tar é o enpacotador do lunix / 2>/dev/null -> nao manda o erro pro terminal -> manda pro "buraco negro"

if [ $? -eq 0 ]; then  # basicamente (se nao deu problema)
    echo "[+] Backup concluído com sucesso: $DESTINO/$NOME_BACKUP" 
else
    echo "[-] Erro ao criar o backup." # se o ultimo valor pego for diferente de 0 (deu ruim)
fi