#!/bin/bash

LOG_FILE="/var/log/auth.log" 

if [ ! -r "$LOG_FILE" ]; then #verifica se tem permissao para ler o arquivo
    echo "[-] Sem permissão de leitura ou ficheiro $LOG_FILE não existe. Tente com sudo."
    exit 1
fi

echo "====================================="
echo " TENTATIVAS FALHADAS DE LOGIN (SSH)"
echo "====================================="

# Filtra linhas com "Failed password" e extrai o IP e o utilizador -> AQUI PEDI PRO GEMINI formatar para que ficasse organizado.
grep "Failed password" "$LOG_FILE" | awk '{print "Data: " $1 " " $2 " " $3 " | Utilizador: " $9 " | IP: " $11}' | tail -n 10 
# awk -> le uma linha e divide cada espaço em uma "gaveta".
echo "====================================="